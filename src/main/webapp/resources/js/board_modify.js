
    $(document).ready(function () {
        $('#content').summernote({
            lang: 'ko-KR',
            height: 300,
            placeholder: '내용을 입력하세요',
            toolbar: [
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                ['color', ['forecolor', 'color']],
                ['table', ['table']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['insert', ['picture', 'link']],
                ['view', ['help']]
            ],
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체',
                '굴림', '돋음체', '바탕체'],
            fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36',
                '50', '72'],
            callbacks: {
                onImageUpload: function (files) {
                    sendFile(files[0], this);
                }
            }
        });
		function closeSummernote() {
			$('#summernote').summernote('destroy');
		}
        function sendFile(file, editor) {
            var data = new FormData();
            data.append("file", file);
            console.log("어팬드 아래"+file);
            
            $.ajax({
                data: data,
                type: "POST",
                url: "insertBoardimgDo",
                enctype:"multipart/form-data",
                contentType: false,
                processData: false,
                success: function (board_img_path) {
                	console.log(board_img_path);
                    $(editor).summernote("insertImage", board_img_path);
                }
            });
        }
            $('#content').on('summernote.change', function () {
                if ($(this).val().length > 4000) {
                    alert("작성 한도를 초과하였습니다.");
                }
            });
        });