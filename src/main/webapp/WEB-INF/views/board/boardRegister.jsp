<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Bootstrap 5를 위한 외부 라이브러리 설정 -->
    <!-- Latest compiled and minified CSS -->
    <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">
    
    <!-- Latest compiled JavaScript -->
    <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- jQuery -->
    <script
    src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
        
    <!-- 아이콘 추가 링크 -->
    <!-- 초기화 아이콘 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardRegister.css">
</head>
<body>
    <div class="container ss">
        <div class="nav_bar">
            <button class="button_tags hover_grey button">공지사항</button>
            <button class="button_tags hover_grey button">Q&A</button>
            <button class="button_tags hover_grey button">질문&답변</button> 
        </div>

        <div class="info_box ss">
            <div class="info_left_box ss me-2">
                 <svg class="image_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M448 80c8.8 0 16 7.2 16 16V415.8l-5-6.5-136-176c-4.5-5.9-11.6-9.3-19-9.3s-14.4 3.4-19 9.3L202 340.7l-30.5-42.7C167 291.7 159.8 288 152 288s-15 3.7-19.5 10.1l-80 112L48 416.3l0-.3V96c0-8.8 7.2-16 16-16H448zM64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zm80 192a48 48 0 1 0 0-96 48 48 0 1 0 0 96z"/></svg>
            </div>
            <div class="info_rigth_box ss">
                <span>이미지가 포함된 문의글을 남겨 주시면 더 정확한 답변을 얻을 수 있습니다.</span>
            </div>
        </div>

        <div class="title_box ss">
            <input type="text" class="title" placeholder="제목에 핵심 내용을 요약하세요.">
        </div>

        <div class="tag_box1 ss mb-4">
            <input type="text" class="tag" placeholder="태그를 설정하세요 (최대 3개)">
        </div>

        <div class="main_text_box1 ss">
            <div class="tool_bar ss">
                <div class="tool_bar_button1 ss">
                    <div class="border_div">
                        <button type="button" aria-label="bold" class="tool_button">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M0 64C0 46.3 14.3 32 32 32H80 96 224c70.7 0 128 57.3 128 128c0 31.3-11.3 60.1-30 82.3c37.1 22.4 62 63.1 62 109.7c0 70.7-57.3 128-128 128H96 80 32c-17.7 0-32-14.3-32-32s14.3-32 32-32H48V256 96H32C14.3 96 0 81.7 0 64zM224 224c35.3 0 64-28.7 64-64s-28.7-64-64-64H112V224H224zM112 288V416H256c35.3 0 64-28.7 64-64s-28.7-64-64-64H224 112z"/></svg>
                        </button>
                        <button type="button" aria-label="bold" class="tool_button">
                            <svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="italic" class="svg-inline--fa fa-italic " role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" style="font-size: 16px; color: inherit;"><path fill="currentColor" d="M128 56c0-13.3 10.7-24 24-24H360c13.3 0 24 10.7 24 24s-10.7 24-24 24H291.3L144.7 432H232c13.3 0 24 10.7 24 24s-10.7 24-24 24H24c-13.3 0-24-10.7-24-24s10.7-24 24-24H92.7L239.3 80H152c-13.3 0-24-10.7-24-24z"></path></svg>
                        </button>
                        <button type="button" aria-label="bold" class="tool_button">
                            <svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="strikethrough" class="svg-inline--fa fa-strikethrough " role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" style="font-size: 16px; color: inherit;"><path fill="currentColor" d="M145.5 138c4-21.5 17.9-37.4 41.7-47.4c24.7-10.4 59.4-13.7 99.9-7.5c12.8 2 52.4 9.5 64.9 12.8c12.8 3.3 25.9-4.3 29.3-17.2s-4.3-25.9-17.2-29.3c-14.7-3.8-56.1-11.7-69.7-13.8c-46.2-7.1-90.4-4.1-125.7 10.7c-36.1 15.1-63.3 43.1-70.5 83.9c-.1 .4-.1 .9-.2 1.3c-2.8 23.4 .5 44.2 9.8 62.2c9.2 17.8 23.2 31.2 38.8 41.5c2.4 1.6 5 3.2 7.5 4.7H24c-13.3 0-24 10.7-24 24s10.7 24 24 24H488c13.3 0 24-10.7 24-24s-10.7-24-24-24H295.8c-9.9-3.1-19.7-6-29.2-8.8l-.3-.1c-37.7-11.1-70.5-20.7-93.3-35.8c-10.9-7.2-18.2-14.9-22.6-23.5c-4.2-8.2-6.6-18.9-4.9-33.8zM364 337.1c3.7 8.6 5.5 20.1 2.6 36.3c-3.8 21.8-17.8 37.9-41.8 48c-24.7 10.4-59.4 13.7-99.8 7.5c-20.1-3.2-54.3-14.6-81.2-23.6l0 0 0 0c-5.9-2-11.4-3.8-16.3-5.4c-12.6-4.1-26.1 2.8-30.3 15.4s2.8 26.2 15.4 30.3c4 1.3 8.8 2.9 14 4.7c26.6 8.9 66.4 22.2 90.9 26.2l.1 0c46.2 7.1 90.4 4.1 125.7-10.7c36.1-15.1 63.3-43.1 70.5-83.9c4-22.9 2.4-43.5-5-61.7H351.6c5.7 5.3 9.7 11 12.3 17.1z"></path></svg>
                        </button>
                        <button type="button" aria-label="bold" class="tool_button ">
                            <svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="link-horizontal" class="svg-inline--fa fa-link-horizontal " role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" style="font-size: 16px; color: inherit;"><path fill="currentColor" d="M143.9 64C64.4 64 0 128.4 0 207.9c0 75.7 58.7 138.5 134.3 143.5l8.1 .5c13.2 .9 24.7-9.1 25.5-22.3s-9.1-24.7-22.4-25.5l-8.1-.5C87.1 300.2 48 258.3 48 207.9c0-52.9 42.9-95.9 95.9-95.9H304.1c52.9 0 95.9 42.9 95.9 95.9c0 50.5-39.1 92.3-89.5 95.6l-8.1 .5c-13.2 .9-23.2 12.3-22.4 25.5s12.3 23.2 25.5 22.3l8.1-.5c75.6-5 134.3-67.8 134.3-143.5C448 128.4 383.6 64 304.1 64H143.9zM496.1 448C575.6 448 640 383.6 640 304.1c0-75.7-58.7-138.5-134.3-143.5l-8.1-.5c-13.2-.9-24.7 9.1-25.5 22.4s9.1 24.7 22.3 25.5l8.1 .5c50.4 3.4 89.5 45.2 89.5 95.6c0 52.9-42.9 95.9-95.9 95.9H335.9c-53 0-95.9-42.9-95.9-95.9c0-50.5 39.1-92.3 89.5-95.7l7.1-.5c13.2-.9 23.2-12.3 22.3-25.6s-12.3-23.2-25.6-22.3l-7.1 .5C250.7 165.6 192 228.4 192 304.1C192 383.6 256.4 448 335.9 448H496.1z"></path></svg>
                        </button>
                        <!-- <button type="button" aria-label="bold" class="tool_button">
                        
                        </button> -->
                        <!-- 아코디언 넣을 수 있으면 넣어야함 -->
                        
                    </div>

                    <div class="toolbar-divider me-3"></div>
                    
                    <div class="border_div">
                        <button type="button" aria-label="bold" class="tool_button">
                            <svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="code" class="svg-inline--fa fa-code " role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" style="font-size: 16px; color: inherit;"><path fill="currentColor" d="M399.1 1.1c-12.7-3.9-26.1 3.1-30 15.8l-144 464c-3.9 12.7 3.1 26.1 15.8 30s26.1-3.1 30-15.8l144-464c3.9-12.7-3.1-26.1-15.8-30zm71.4 118.5c-9.1 9.7-8.6 24.9 1.1 33.9L580.9 256 471.6 358.5c-9.7 9.1-10.2 24.3-1.1 33.9s24.3 10.2 33.9 1.1l128-120c4.8-4.5 7.6-10.9 7.6-17.5s-2.7-13-7.6-17.5l-128-120c-9.7-9.1-24.9-8.6-33.9 1.1zm-301 0c-9.1-9.7-24.3-10.2-33.9-1.1l-128 120C2.7 243 0 249.4 0 256s2.7 13 7.6 17.5l128 120c9.7 9.1 24.9 8.6 33.9-1.1s8.6-24.9-1.1-33.9L59.1 256 168.4 153.5c9.7-9.1 10.2-24.3 1.1-33.9z"></path></svg>
                        </button>
                        <button type="button" aria-label="bold" class="tool_button">
                            <svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="rectangle-code" class="svg-inline--fa fa-rectangle-code " role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" style="font-size: 16px; color: inherit;"><path fill="currentColor" d="M448 80c8.8 0 16 7.2 16 16V416c0 8.8-7.2 16-16 16H64c-8.8 0-16-7.2-16-16V96c0-8.8 7.2-16 16-16H448zM64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zM287 175c-9.4 9.4-9.4 24.6 0 33.9l47 47-47 47c-9.4 9.4-9.4 24.6 0 33.9s24.6 9.4 33.9 0l64-64c9.4-9.4 9.4-24.6 0-33.9l-64-64c-9.4-9.4-24.6-9.4-33.9 0zM225 209c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0l-64 64c-9.4 9.4-9.4 24.6 0 33.9l64 64c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9l-47-47 47-47z"></path></svg>
                        </button>
                        <button type="button" aria-label="bold" class="tool_button">
                            <svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="quote-left" class="svg-inline--fa fa-quote-left " role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" style="font-size: 16px; color: inherit;"><path fill="currentColor" d="M0 216C0 149.7 53.7 96 120 96h16c13.3 0 24 10.7 24 24s-10.7 24-24 24H120c-39.8 0-72 32.2-72 72v10c5.1-1.3 10.5-2 16-2h64c35.3 0 64 28.7 64 64v64c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V320 288 216zm48 72v32 32c0 8.8 7.2 16 16 16h64c8.8 0 16-7.2 16-16V288c0-8.8-7.2-16-16-16H64c-8.8 0-16 7.2-16 16zm336-16H320c-8.8 0-16 7.2-16 16v32 32c0 8.8 7.2 16 16 16h64c8.8 0 16-7.2 16-16V288c0-8.8-7.2-16-16-16zM256 320V288 216c0-66.3 53.7-120 120-120h16c13.3 0 24 10.7 24 24s-10.7 24-24 24H376c-39.8 0-72 32.2-72 72v10c5.1-1.3 10.5-2 16-2h64c35.3 0 64 28.7 64 64v64c0 35.3-28.7 64-64 64H320c-35.3 0-64-28.7-64-64V320z"></path></svg>
                        </button>
                        <button type="button" aria-label="bold" class="tool_button ">
                            <svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="image" class="svg-inline--fa fa-image " role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" style="font-size: 16px; color: inherit;"><path fill="currentColor" d="M448 80c8.8 0 16 7.2 16 16V415.8l-5-6.5-136-176c-4.5-5.9-11.6-9.3-19-9.3s-14.4 3.4-19 9.3L202 340.7l-30.5-42.7C167 291.7 159.8 288 152 288s-15 3.7-19.5 10.1l-80 112L48 416.3l0-.3V96c0-8.8 7.2-16 16-16H448zM64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zm80 192a48 48 0 1 0 0-96 48 48 0 1 0 0 96z"></path></svg>
                        </button>
                        <!-- <button type="button" aria-label="bold" class="tool_button">
                        
                        </button> -->
                        <!-- 아코디언 넣을 수 있으면 넣어야함 -->
                        
                    </div>
                </div>
            </div>

            <div class="main_text_div ss">
                <input type="text" class="main_text" placeholder="질문을 적어주세요">
            </div>

        </div>
        
        <div class="bottom_button">
            <button class="cancel_button round_box ss btn btn-md me-4">취소</button>
            <button class="register_button round_box ss btn btn-md me-3">등록</button>
        </div>
    </div>
    
</body>
</html>