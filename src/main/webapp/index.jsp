<!DOCTYPE html>
<html>

    <head>
        <meta name="viewport" content="width=device-width" />
        <title>WebSocket 客户端</title>
    </head>

    <body>
        <div>
            <input type="button" id="btnConnection" value="连接" />
            <input type="button" id="btnClose" value="关闭" />
            <input type="button" id="btnSend" value="发送" />
        </div>
        <script src="jslib/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">
            var socket;
            if(typeof(WebSocket) == "undefined") {
                alert("您的浏览器不支持WebSocket");
                return;
            }

            $("#btnConnection").click(function() {
                //实现化WebSocket对象，指定要连接的服务器地址与端口
                socket = new WebSocket("ws://192.168.0.36:30002");
                //打开事件
                socket.onopen = function() {
                    alert("Socket 已打开");
                };
                //获得消息事件
                socket.onmessage = function(msg) {
                    alert(msg.data);
                };
                //关闭事件
                socket.onclose = function() {
                    alert("Socket已关闭");
                };
                //发生了错误事件
                socket.onerror = function() {
                    alert("发生了错误");
                }
            });
            
            //发送消息
            $("#btnSend").click(function() {
                socket.send("这是来自客户端的消息" + location.href + new Date());
            });
            
            //关闭
            $("#btnClose").click(function() {
                socket.close();
            });
        </script>
    </body>

</html>