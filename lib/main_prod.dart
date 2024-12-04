import 'package:flutter_flavor/flutter_flavor.dart';

import 'main_core.dart' as core;

void main() => core.initMain(
      () => FlavorConfig(
        name: 'dev',
        variables: {
          'baseUrl': 'ApiReferences.baseUrlProd',
          'connectionTimeout': 'ApiReferences.connectionTimeout',
          'receiveTimeout': 'ApiReferences.receiveTimeout',
        },
      ),
    );
