    <div class="wrapper">
        <div class="title">Tìm kiếm thêm tại đây</div>
        <div class="form">
            <div class="bot-inbox inbox">
                <div class="icon">
                    <img src="../icons/call_in_des.webp" alt="">
                </div>
                <div class="msg-header">
                    <p>Bắt đầu trò chuyện !</p>
                </div>
            </div>
        </div>
        <div class="typing-field">
            <div class="input-data">
                <input id="data" type="text" placeholder="Type something here.." required>
                <button id="send-btn">Send</button>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function(){
            $("#send-btn").on("click", function(){
                $value = $("#data").val();
                $msg = '<div class="user-inbox inbox"><div class="msg-header"><p>'+ $value +'</p></div></div>';
                $(".form").append($msg);
                $("#data").val('');
                
                // start ajax code
                $.ajax({
                    url: '../chatbot/mess.php',
                    type: 'POST',
                    data: 'text='+$value,
                    success: function(result){
                        $replay = '<div class="bot-inbox inbox"><div class="icon"><img src="../icons/call_in_des.webp" alt=""></div><div class="msg-header"><p>'+ result +'</p></div></div>';
                        $(".form").append($replay);
                       // khi trò chuyện đi xuống, thanh cuộn sẽ tự động xuống dưới cùng
                        $(".form").scrollTop($(".form")[0].scrollHeight);
                    }
                });
            });
        });
    </script>
