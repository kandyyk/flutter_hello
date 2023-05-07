import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// 请求方法
enum DioMethod {
  get,
  post,
  put,
  delete,
  patch,
  head,
}

class HttpClient {
  /// 单例模式
  static HttpClient? _instance;
  factory HttpClient() => _instance ?? HttpClient._internal();
  static HttpClient? get instance => _instance ?? HttpClient._internal();

  /// 连接超时时间
  static const int connectTimeout = 60 * 1000;

  /// 响应超时时间
  static const int receiveTimeout = 60 * 1000;

  static const baseURL = "https://xiaomi.itying.com/";

  static const methodValues = {
    DioMethod.get: 'get',
    DioMethod.post: 'post',
    DioMethod.put: 'put',
    DioMethod.delete: 'delete',
    DioMethod.patch: 'patch',
    DioMethod.head: 'head'
  };

  /// Dio实例
  static Dio _dio = Dio();

  /// 初始化
  HttpClient._internal() {
    // 初始化基本选项
    BaseOptions options = BaseOptions(
        baseUrl: baseURL,
        connectTimeout: const Duration(milliseconds: connectTimeout),
        receiveTimeout: const Duration(milliseconds: receiveTimeout));
    _instance = this;
    // 初始化dio
    _dio = Dio(options);
    // 添加拦截器
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onResponse, onError: _onError));
  }

  /// 请求拦截器
  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 对非open的接口的请求参数全部增加userId
    // if (!options.path.contains("open")) {
    //   options.queryParameters["userId"] = "xxx";
    // }
    // 头部添加token
    // options.headers["token"] = "xxx";
    // 更多业务需求
    print(options.path);
    handler.next(options); //必须加上才能走到回调
    // super.onRequest(options, handler);
  }

  /// 相应拦截器
  void _onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    // 请求成功是对数据做基本处理
    if (response.statusCode == 200) {
      // ....
    } else {
      // ....
    }
    if (response.requestOptions.baseUrl.contains("???????")) {
      // 对某些单独的url返回数据做特殊处理
    }
    handler.next(response); //必须加上才能走到回调
  }

  /// 错误处理
  void _onError(DioError error, ErrorInterceptorHandler handler) {
    handler.next(error); //必须加上才能走到回调
  }

  /// 请求类
  Future<T> request<T>(
    String path, {
    DioMethod method = DioMethod.get,
    Map<String, dynamic>? params,
    data,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    options ??= Options(method: methodValues[method]);
    try {
      Response response;
      response = await _dio.request(path,
          data: data,
          queryParameters: params,
          cancelToken: cancelToken,
          options: options,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } on DioError catch (e) {
      rethrow;
    }
  }

  Future get(apiPath) async {
    try {
      var response = await _dio.get(apiPath);
      if (response.data != null) {
        return response.data;
      } else {
        return null;
      }
    } on DioError catch (e) {
      debugPrint("---catchError:$e.message");
      return null;
    }
  }

  /// 开启日志打印
  /// 需要打印日志的接口在接口请求前 HttpClient.instance?.openLog();
  void openLog() {
    _dio.interceptors
        .add(LogInterceptor(responseHeader: false, responseBody: true));
  }
}
