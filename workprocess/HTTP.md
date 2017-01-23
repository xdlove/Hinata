# [HTTP status_code](https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html)

## Server Error 5xx

### 500 Internal Server Error

The server encountered an unexpected condition which prevented it from fulfilling the request.
服务器遭遇了一个无法预料到的错误，这个错误导致了服务器不能很好的处理 HTTP 请求，并且抛出 500 状态码。

### 501 Not Implemented

The server does not support the functionality required to fulfill the request. This is the appropriate response when the server does not recognize the request method and is not capable of supporting it for any resource.
服务器没有支持处理当前 HTTP 请求的功能。501 状态码是一个适当的响应，当服务器不认识 HTTP 请求的方法和不能够通过任何资源来支持当前请求时，就会抛出这样的响应。

### 502 Bad Gateway

The server, while acting as a gateway or proxy, received an invalid response from the upstream server it accessed in attempting to fulfill the request.
网关服务器或者代理服务器从它访问的上游服务器（处理当前 HTTP 请求的服务器）接收到一个无效的 HTTP 响应，就会抛出 502 状态码。

### 503 Server Unavailable

The server is currently unable to handle the request due to a temporary overloading or maintenance of the server. The implication is that this is a temporary condition which will be alleviated after some delay. If known, the length of the delay MAY be indicated in a Retry-After header. If no Retry-After is given, the client SHOULD handle the response as it would for a 500 response.
服务器目前由于服务器超载或者维护，导致暂时无法处理 HTTP 请求。 503 状态码的含义指这种服务器错误是暂时的，是可以在延迟一段时间后可以恢复的。如果能够估算大概的延迟时间，服务器需要加一个 Retry-After 响应头。如果没有这个响应头，客户端会当成状态码为 500 来处理。

Note: The existence of the 503 status code does not imply that a server must use it when becoming overloaded. Some servers may wish to simply refuse the connection.
注意： 503 状态码的存在并不意味着服务器必须要使用这种状态码，一些服务器为了简单会直接拒绝链接。

### 504 Geteway Timeout

The server, while acting as a gateway or proxy, did not receive a timely response from the upstream server specified by the URI (e.g. HTTP, FTP, LDAP) or some other auxiliary server (e.g. DNS) it needed to access in attempting to complete the request.
作为一个网关或者代理的服务器，正在完成客户访问所需网址的请求。为了完成请求，该服务器访问上游服务器，但是不能及时得到响应。这通常意味着上游服务器已经关闭。

Note: Note to implementors: some deployed proxies are known to return 400 or 500 when DNS lookups time out.
注意：开发者们请注意，一些代理服务器会返回 400 或者 500，当 DNS 解析超时的时候。

### 505 HTTP Version Not Supported

The server does not support, or refuses to support, the HTTP protocol version that was used in the request message. The server is indicating that it is unable or unwilling to complete the request using the same major version as the client, as described in section 3.1, other than with this error message. The response SHOULD contain an entity describing why that version is not supported and what other protocols are supported by that server.
服务器不支持或者拒绝支持客户端发送给服务器的 HTTP 请求数据流中的指定的 HTTP 协议版本,它无法或不愿意用客户端所提供的主版本号来完成请求。服务器的响应必须包含为什么客户端指定的 HTTP 协议版本不被支持和服务器支持什么版本.