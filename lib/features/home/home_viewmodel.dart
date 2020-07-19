import 'dart:async';

import 'package:fluttermvvm/base/BaseViewModel.dart';
import 'package:fluttermvvm/models/discovery.dart';
import 'package:fluttermvvm/utils/repository.dart';

class HomeViewModel implements BaseViewModel {
  var _mailTextController = StreamController<String>.broadcast();

  final Repository repository;

  HomeViewModel(this.repository);

  @override
  void dispose() {
    _mailTextController.close();
  }

  Stream<DiscoveryResponse> get discoveries =>
      Stream.fromFuture(repository.getDiscoveryMovies());
}
