import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_app/core/injector/injector_provider.dart';
import 'package:food_app/core/network/network_constants.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:food_app/core/network/token_interceptor.dart';
import 'package:food_app/core/utilities/logging.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class DioClient {
  final Dio _dio;

  DioClient._(this._dio); // Private constructor for singleton pattern

  // Asynchronous factory constructor for initializing DioClient with cache setup
  static Future<DioClient> create() async {
    // Get application documents directory (or temporary directory if you prefer)
    final cacheDir = await getApplicationDocumentsDirectory();

    // Set up the HiveCacheStore with the directory path
    final cacheStore = HiveCacheStore(cacheDir.path);

    final dio = Dio(BaseOptions(
      baseUrl: NetworkConstants.baseUrl, // Set your base URL here
      connectTimeout: const Duration(seconds: NetworkConstants.connectTimeout),
      receiveTimeout: const Duration(seconds: NetworkConstants.receiveTimeout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // Set up cache options
    final cacheOptions = CacheOptions(
      policy: CachePolicy.request,
      store: cacheStore,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 1),
      priority: CachePriority.normal,
      // Set the cache key builder for custom keys if needed
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    );

    // Add the caching interceptor
    dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
//
    final token =await getToken()??'';
    // final tokenInterceptor = TokenInterceptor();
    // dio.interceptors.add(tokenInterceptor);
    // Add additional interceptors if needed (e.g., for logging or token handling)
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add any headers like tokens before request
        if (token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Handle the response
        return handler.next(response);
      },
      onError: (DioError error, handler) async {
        if (error.type == DioErrorType.connectionTimeout ||
            error.type == DioErrorType.connectionError ||
            error.type == DioErrorType.receiveTimeout ||
            error.type == DioErrorType.sendTimeout) {

          // Manually set policy to `cacheStoreOnly` on error
          final cacheKey = CacheOptions.defaultCacheKeyBuilder(error.requestOptions);

          try {
            final cacheResponse = await cacheStore.get(cacheKey);

            if (cacheResponse != null) {
              final cachedResponse = cacheResponse.toResponse(error.requestOptions);
              print('Serving cached response for: ${error.requestOptions.uri}');
              return handler.resolve(cachedResponse);
            } else {
              print('No cached response available for: ${error.requestOptions.uri}');
            }
          } catch (e) {
            print('Error retrieving from cache: $e');
          }
        }
        // If no cached response is found, return the original error
        return handler.next(error);
      },
    ));

    return DioClient._(dio);
  }


  static Future<String?> getToken() async {
    try {
      const FlutterSecureStorage secureStorage = FlutterSecureStorage();
      const userDataKey = 'userData';
      String? userJson = await secureStorage.read(key: userDataKey);
      final map = jsonDecode(userJson ?? "");
      return map['token'] ?? '';
    } on Exception catch (e) {
      // TODO
      Logging.error('getToken error $e');
    }
  }

  Dio get dio => _dio;


static  Future<void> reinitializeDioClient(String token) async {
    // Unregister the current instance
    if (getIt.isRegistered<DioClient>()) {
      getIt.unregister<DioClient>();
    }

    // Create a new DioClient instance with the updated token
    final dioClient = await DioClient.create();

    // Manually set the token header in the new instance
    dioClient.dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ));

    // Register the new instance
    getIt.registerSingleton<DioClient>(dioClient);
  }

}
