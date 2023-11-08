import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_translate/flutter_translate.dart';

part 'detail_service_model.freezed.dart';

@freezed
class DetailServiceModel with _$DetailServiceModel {
  const factory DetailServiceModel({
    required String title,
    required String subtitle,
    required String desc,
  }) = _DetailServiceModel;
}

// const services = <DetailServiceModel>[
//   DetailServiceModel(
//     title: 'Saúde',
//     subtitle: 'Lorem ipsum dolor sit amet',
//     desc:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non tortor est. Nulla feugiat nibh odio, sit amet fermentum nisl dictum vitae. Cras ultricies venenatis mi sit amet fermentum. Suspendisse potenti. Integer ligula nisi, molestie quis pretium sed, porttitor ac lacus. Pellentesque sit amet urna diam. Integer ultricies molestie odio, quis facilisis odio lobortis volutpat. Proin faucibus ipsum metus, ut condimentum sapien laoreet ac. Praesent ligula augue, volutpat ut ultrices id, venenatis ac tortor. Donec ornare ac turpis nec efficitur. Aenean accumsan ex eu ex laoreet, faucibus posuere lorem tempor. Duis in purus sed sapien venenatis rhoncus sed condimentum felis. Nullam scelerisque augue non ante varius, sit amet aliquet dolor gravida. Sed ullamcorper non diam eu hendrerit.',
//   ),
//   DetailServiceModel(
//     title: 'Segurança Social',
//     subtitle: 'Lorem ipsum dolor sit amet',
//     desc:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non tortor est. Nulla feugiat nibh odio, sit amet fermentum nisl dictum vitae. Cras ultricies venenatis mi sit amet fermentum. Suspendisse potenti. Integer ligula nisi, molestie quis pretium sed, porttitor ac lacus. Pellentesque sit amet urna diam. Integer ultricies molestie odio, quis facilisis odio lobortis volutpat. Proin faucibus ipsum metus, ut condimentum sapien laoreet ac. Praesent ligula augue, volutpat ut ultrices id, venenatis ac tortor. Donec ornare ac turpis nec efficitur. Aenean accumsan ex eu ex laoreet, faucibus posuere lorem tempor. Duis in purus sed sapien venenatis rhoncus sed condimentum felis. Nullam scelerisque augue non ante varius, sit amet aliquet dolor gravida. Sed ullamcorper non diam eu hendrerit.',
//   ),
//   DetailServiceModel(
//     title: 'Nacionalidade',
//     subtitle: 'Lorem ipsum dolor sit amet',
//     desc:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non tortor est. Nulla feugiat nibh odio, sit amet fermentum nisl dictum vitae. Cras ultricies venenatis mi sit amet fermentum. Suspendisse potenti. Integer ligula nisi, molestie quis pretium sed, porttitor ac lacus. Pellentesque sit amet urna diam. Integer ultricies molestie odio, quis facilisis odio lobortis volutpat. Proin faucibus ipsum metus, ut condimentum sapien laoreet ac. Praesent ligula augue, volutpat ut ultrices id, venenatis ac tortor. Donec ornare ac turpis nec efficitur. Aenean accumsan ex eu ex laoreet, faucibus posuere lorem tempor. Duis in purus sed sapien venenatis rhoncus sed condimentum felis. Nullam scelerisque augue non ante varius, sit amet aliquet dolor gravida. Sed ullamcorper non diam eu hendrerit.',
//   ),
//   DetailServiceModel(
//     title: 'Iniciativas',
//     subtitle: 'Lorem ipsum dolor sit amet',
//     desc:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non tortor est. Nulla feugiat nibh odio, sit amet fermentum nisl dictum vitae. Cras ultricies venenatis mi sit amet fermentum. Suspendisse potenti. Integer ligula nisi, molestie quis pretium sed, porttitor ac lacus. Pellentesque sit amet urna diam. Integer ultricies molestie odio, quis facilisis odio lobortis volutpat. Proin faucibus ipsum metus, ut condimentum sapien laoreet ac. Praesent ligula augue, volutpat ut ultrices id, venenatis ac tortor. Donec ornare ac turpis nec efficitur. Aenean accumsan ex eu ex laoreet, faucibus posuere lorem tempor. Duis in purus sed sapien venenatis rhoncus sed condimentum felis. Nullam scelerisque augue non ante varius, sit amet aliquet dolor gravida. Sed ullamcorper non diam eu hendrerit.',
//   ),
//   DetailServiceModel(
//     title: 'Habitação',
//     subtitle: 'Lorem ipsum dolor sit amet',
//     desc:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non tortor est. Nulla feugiat nibh odio, sit amet fermentum nisl dictum vitae. Cras ultricies venenatis mi sit amet fermentum. Suspendisse potenti. Integer ligula nisi, molestie quis pretium sed, porttitor ac lacus. Pellentesque sit amet urna diam. Integer ultricies molestie odio, quis facilisis odio lobortis volutpat. Proin faucibus ipsum metus, ut condimentum sapien laoreet ac. Praesent ligula augue, volutpat ut ultrices id, venenatis ac tortor. Donec ornare ac turpis nec efficitur. Aenean accumsan ex eu ex laoreet, faucibus posuere lorem tempor. Duis in purus sed sapien venenatis rhoncus sed condimentum felis. Nullam scelerisque augue non ante varius, sit amet aliquet dolor gravida. Sed ullamcorper non diam eu hendrerit.',
//   ),
//   DetailServiceModel(
//     title: 'Finanças',
//     subtitle: 'Lorem ipsum dolor sit amet',
//     desc:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non tortor est. Nulla feugiat nibh odio, sit amet fermentum nisl dictum vitae. Cras ultricies venenatis mi sit amet fermentum. Suspendisse potenti. Integer ligula nisi, molestie quis pretium sed, porttitor ac lacus. Pellentesque sit amet urna diam. Integer ultricies molestie odio, quis facilisis odio lobortis volutpat. Proin faucibus ipsum metus, ut condimentum sapien laoreet ac. Praesent ligula augue, volutpat ut ultrices id, venenatis ac tortor. Donec ornare ac turpis nec efficitur. Aenean accumsan ex eu ex laoreet, faucibus posuere lorem tempor. Duis in purus sed sapien venenatis rhoncus sed condimentum felis. Nullam scelerisque augue non ante varius, sit amet aliquet dolor gravida. Sed ullamcorper non diam eu hendrerit.',
//   ),
//   DetailServiceModel(
//     title: '+INFO',
//     subtitle: 'Lorem ipsum dolor sit amet',
//     desc:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non tortor est. Nulla feugiat nibh odio, sit amet fermentum nisl dictum vitae. Cras ultricies venenatis mi sit amet fermentum. Suspendisse potenti. Integer ligula nisi, molestie quis pretium sed, porttitor ac lacus. Pellentesque sit amet urna diam. Integer ultricies molestie odio, quis facilisis odio lobortis volutpat. Proin faucibus ipsum metus, ut condimentum sapien laoreet ac. Praesent ligula augue, volutpat ut ultrices id, venenatis ac tortor. Donec ornare ac turpis nec efficitur. Aenean accumsan ex eu ex laoreet, faucibus posuere lorem tempor. Duis in purus sed sapien venenatis rhoncus sed condimentum felis. Nullam scelerisque augue non ante varius, sit amet aliquet dolor gravida. Sed ullamcorper non diam eu hendrerit.',
//   ),
//   DetailServiceModel(
//     title: 'Formaçoes',
//     subtitle: 'Lorem ipsum dolor sit amet',
//     desc:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non tortor est. Nulla feugiat nibh odio, sit amet fermentum nisl dictum vitae. Cras ultricies venenatis mi sit amet fermentum. Suspendisse potenti. Integer ligula nisi, molestie quis pretium sed, porttitor ac lacus. Pellentesque sit amet urna diam. Integer ultricies molestie odio, quis facilisis odio lobortis volutpat. Proin faucibus ipsum metus, ut condimentum sapien laoreet ac. Praesent ligula augue, volutpat ut ultrices id, venenatis ac tortor. Donec ornare ac turpis nec efficitur. Aenean accumsan ex eu ex laoreet, faucibus posuere lorem tempor. Duis in purus sed sapien venenatis rhoncus sed condimentum felis. Nullam scelerisque augue non ante varius, sit amet aliquet dolor gravida. Sed ullamcorper non diam eu hendrerit.',
//   ),
// ];
