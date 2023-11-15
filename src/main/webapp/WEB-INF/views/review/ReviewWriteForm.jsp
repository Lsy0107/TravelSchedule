<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>Modern Business - Start Bootstrap Template</title>
            <!-- Favicon-->
            <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
            <!-- Bootstrap icons-->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
            <!-- Core theme CSS (includes Bootstrap)-->
            <link href="resources/css/styles.css" rel="stylesheet" />
            <style>
                .wrap {
                    width: 45%;
                    margin-left: auto;
                    margin-right: auto;
                    margin-top: 115px;
                    margin-bottom: 50px;
                    background-color: white;
                    padding: 20px;
                    border-radius: 25px;
                    box-shadow: 0 4px 10px 0 rgba(0, 0, 0, 0.2), 0 4px 20px 0 rgba(0, 0, 0, 0.19);
                }

                .disnone {
                    display: none;
                }

                .imgDiv {

                    max-width: 100%;
                    margin-bottom: 10px;
                }

                .tImg {
                    display: flex;
                }

                .fImg {
                    display: flex;
                }

                .img {
                    width: 24vh;
                    height: 18vh;
                    border-radius: 10px;
                }

                .ReTextArea {
                    width: 100%;
                    height: 500px;
                    padding: 10px;
                    border-radius: 10px;
                }

                .Title {
                    width: 100%;
                    height: 60px;
                    padding: 10px;
                    border-radius: 10px;
                    margin-bottom: 10px;
                    border: none;
                    border-bottom: 1px solid;
                    margin-bottom: 10px;
                }

                input:focus {
                    outline: none;
                }

                body {
                    background-color: white;
                }

                .ReFile {
                    border: 1px solid;
                    padding: 9px;
                    border-radius: 11px;
                    margin-bottom: 10px;
                }

                .Disn {
                    display: none;
                }

                #img {
                    width: 150px;
                    height: 150px;
                }

                ck-img {
                    border: 3px solid blue;
                }

                .section::-webkit-scrollbar {
                    height: 10px;
                }

                .section::-webkit-scrollbar-track {
                    background-color: gray;
                    border-radius: 100px;
                }

                .section::-webkit-scrollbar-thumb {
                    border-radius: 100px;
                    background-color: black;
                    box-shadow: inset 2px 2px 5px 0 rgba(#fff, 0.5);
                }

                .Active {
                    animation-name: blur;
                    animation-fill-mode: forwards;
                    animation-duration: 0.5s;
                    animation-delay: 0s;
                    animation-direction: normal;
                }

                .InActive {
                    animation-name: blurRe;
                    animation-fill-mode: forwards;
                    animation-duration: 0.5s;
                    animation-delay: 0s;
                    animation-direction: normal;
                }

                @keyframes blur {
                    0% {
                        opacity: 1;
                        padding: 0px;
                        border-radius: 10px;
                    }

                    100% {
                        opacity: 0.4;
                        padding: 20px;
                        border-radius: 10px;
                    }
                }

                @keyframes blurRe {
                    0% {
                        opacity: 0.4;
                        padding: 20px;
                        border-radius: 10px;
                    }

                    100% {
                        opacity: 1;
                        padding: 0px;
                        border-radius: 10px;
                    }
                }

                .ID {
                    margin: 10px;
                }

                .RePhotoArr>img {
                    margin: 10px;
                }

                .RePhotoArr {
                    overflow: auto;
                    white-space: nowrap;
                    min-height: 190px;
                    max-height: 190px;
                }
                .Delete {
                animation-name: DeleteMotion;
                animation-fill-mode: forwards;
                animation-duration: 0.5s;
                animation-delay: 0s;
                animation-direction: normal;
            }

            @keyframes DeleteMotion {
                0% {
                    padding: 0px;
                }

                100% {
                    padding: 83px;
                    display: none;
                }
            }
            </style>
        </head>

        <body class="d-flex flex-column h-100">
            <%@ include file="/WEB-INF/views/include/menu.jsp" %>
                <div class="wrap">
                    <div class="ReTitle">
                        <input type="text" class="Title" name="title" placeholder="제목">
                    </div>
                    <div class="ReSelImg">
                        <div class="card-header">
                            <ul class="nav nav-tabs card-header-tabs">
                                <li class="nav-item"><a id="meminfoA" class="nav-link active" aria-current="true"
                                        href="javascript:chageDisplay('meminfo')">여행지</a></li>
                                <li class="nav-item"><a id="weatherA" class="nav-link"
                                        href="javascript:chageDisplay('weather')">축제</a></li>
                            </ul>
                        </div>
                        <div class="imgDiv">
                            <div class="tdest section" id="meminfoTag" style="overflow-x: auto;">
                                <div class="tImg">
                                    <c:forEach var="td" items="${Td}">
                                        <div class="ID">
                                            <div class="CheckDiv">
                                                <span class="d-flex">${td.TDNAME}</span>
                                                <input style="display: none;" type="checkbox" name="TF"
                                                    id="${td.TDCODE}" value="${td.TDCODE}">
                                                <label for="${td.TDCODE}"><img onclick="checkImg('${td.TDCODE}')"
                                                        name="TF" value="${td.TDCODE}" class="${td.TDCODE} img"
                                                        src="${td.TDPHOTO}" alt="" onerror="this.src='/resources/tdest/3509.jpg'"></label>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="fest disnone" id="weatherTag" style="overflow-x: auto;">
                                <div class="fImg">
                                    <c:forEach var="fe" items="${Fe}">
                                        <div class="ID">
                                            <div class="CheckDiv">
                                                <span class="d-flex">${fe.FENAME}</span>
                                                <input style="display: none;" type="checkbox" name="TF"
                                                    id="${fe.FECODE}" value="${fe.FECODE}">
                                                <label for="${fe.FECODE}"><img onclick="checkImgFe('${fe.FECODE}')"
                                                        name="FE" value="${fe.FECODE}" class="${fe.FECODE} img"
                                                        src="${fe.FEPOSTER}" alt=""></label>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="margin-bottom: 5px;" class="ReContents">
                        <textarea class="ReTextArea" name="contents"></textarea>
                    </div>
                    <div class="ReFile">
                        <label for="file1">파일</label>
                        <form action="InsertReview" class="FormTag" enctype="multipart/form-data" method="post">
                            <input type="file" id="file1" multiple name="profiledata">
                            <input type="text" name="cdcode" value="${Cl.cdcode}" class="Disn">
                        </form>
                    </div>
                    <div class="RePhotoArr">
                    </div>

                    <div class="FormBtn">
                        <button class="btn btn-outline-success" onclick="return ReviewSubmitCheck()"
                            style="width: 100%;">등록</button>
                    </div>
                </div>






                <!-- Footer-->
                <%@ include file="/WEB-INF/views/include/footer.jsp" %>
                    <!-- Bootstrap core JS-->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                    <!-- Core theme JS-->
                    <script src="resources/js/scripts.js"></script>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

                    <script>
                        function checkImg(e) {
                            console.log(e);
                            let checkImgDiv = document.querySelector('.' + e);
                            let checkLabel = document.getElementById(e);
                            console.log(document.querySelector('#' + e).checked)
                            if (!$('input:checkbox[id=' + e + ']').is(':checked')) {
                                checkImgDiv.classList.remove('InActive');
                                checkImgDiv.classList.add('Active');
                            }

                            else {
                                checkImgDiv.classList.remove('Active');
                                checkImgDiv.classList.add('InActive');
                            }

                        }
                        function checkImgFe(e) {
                            console.log(e);
                            let checkImgDiv = document.querySelector('.' + e);
                            let checkLabel = document.getElementById(e);
                            console.log(document.querySelector('#' + e).checked)
                            if (!$('input:checkbox[id=' + e + ']').is(':checked')) {
                                checkImgDiv.classList.remove('InActive');
                                checkImgDiv.classList.add('Active');
                            }

                            else {
                                checkImgDiv.classList.remove('Active');
                                checkImgDiv.classList.add('InActive');
                            }
                        }
                    </script>

                    <script type="text/javascript">

                        function chageDisplay(seloption) {
                            let meminfoTag = document.querySelector('#meminfoTag');
                            let weatherinfoTag = document.querySelector('#weatherTag');
                            let meminfoA = document.querySelector('#meminfoA');
                            let weatherA = document.querySelector('#weatherA');
                            switch (seloption) {
                                case 'meminfo':
                                    if (meminfoTag.classList.contains('disnone')) {
                                        weatherinfoTag.classList.add('disnone');
                                        meminfoTag.classList.remove('disnone');
                                        meminfoA.classList.add('active');
                                        weatherA.classList.remove('active');
                                    }
                                    break;
                                case 'weather':
                                    if (weatherTag.classList.contains('disnone')) {
                                        weatherinfoTag.classList.remove('disnone');
                                        meminfoTag.classList.add('disnone');
                                        meminfoA.classList.remove('active');
                                        weatherA.classList.add('active');
                                    }
                                    break;
                            }
                        }
                    </script>

                    <script>
                        //업로드한 파일 미리보기

                        var set_file = [];

                        $(document).ready(function () {
                            $("#file1").on("change", handleImgFileSelect);
                        });
                        function handleImgFileSelect(e) {
                            var files = e.target.files;
                            var filesArr = Array.prototype.slice.call(files);

                            // console.log('filesArr : '+filesArr)
                            var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
                            let imgDiv = document.querySelector('.RePhotoArr');
                            filesArr.forEach(function (f) {
                                if (!f.type.match(reg)) {
                                    alert("이미지 확장자만 선택 가능합니다.");
                                    return;
                                }


                                set_file.push(f);

                                var reader = new FileReader();
                                reader.onload = function (e) {
                                    console.log('이거')


                                    let imgTag = document.createElement('img');
                                    //imgTag.setAttribute('id',"img");
                                    //$("#img").attr("src", );
                                    imgTag.setAttribute("src", e.target.result)  //"<img src=\""+e.target.result+"\"data-file='"+f.name+"'>
                                    imgTag.setAttribute("data-file", f.name);
                                    imgTag.classList.add('img');
                                    imgTag.addEventListener('click', function (e) {
                                        let confirmDel = confirm('해당 사진을 삭제 하시겠습니까?');

                                        if (confirmDel == true) {
                                            console.log(e.target);

                                            e.target.classList.add('Delete');
                                        }
                                        else {
                                            return false;
                                        }
                                    });
                                    imgTag.style.margin = '10px';
                                    console.log(imgTag)
                                    //imgDiv.appendChild(imgTag);
                                    imgDiv.appendChild(imgTag);

                                }
                                reader.readAsDataURL(f);
                            });
                        }
                    </script>


                    <script>
                        function ReviewSubmitCheck() {
                            //제목
                            let titleIn = document.querySelector('.Title');
                            let title = titleIn.value;

                            //내용
                            let contentsIn = document.querySelector('.ReTextArea');
                            let contents = contentsIn.value;
                            if (title == "" || contents == "") {
                                alert("제목과 내용을 입력해주세요.");
                                console.log('false');
                                return false;

                            } else {
                                console.log('true');
                                if (!$('input:checkbox[name=TF]').is(':checked')) {
                                    alert('최소한 1개 이상의 여행지를 선택해주십시오.');
                                    return false;
                                } else {
                                    var checkVal = $('input[name=TF]:checked'); //체크박스 체크 유무 확인

                                    let codeList = "";
                                    for (let ch of checkVal) {
                                        let cVal = ch.value; //체크박스의 값 가져오기
                                        console.log(cVal);

                                        codeList += cVal + '/'; //선택한 체크박스의 값 코드를 문자열에 추가
                                    }

                                    console.log(codeList);

                                    SubmitReview(title, contents, codeList);
                                }
                            }




                        }

                        function SubmitReview(title, contents, codeList) {
                            //console.log('여기');

                            let foEl = document.querySelector('.FormTag');

                            let inputTtitle = document.createElement('input');
                            inputTtitle.setAttribute('value', title);
                            inputTtitle.setAttribute('name', 'title');
                            inputTtitle.classList.add('Disn');

                            let inputContents = document.createElement('input');
                            inputContents.setAttribute('value', contents);
                            inputContents.setAttribute('name', 'contents');
                            inputContents.classList.add('Disn');

                            let inputCodeList = document.createElement('input');
                            inputCodeList.setAttribute('value', codeList);
                            inputCodeList.setAttribute('name', 'codeList')
                            inputCodeList.classList.add('Disn');

                            foEl.appendChild(inputTtitle);
                            foEl.appendChild(inputContents);
                            foEl.appendChild(inputCodeList);


                            foEl.submit();


                        }
                    </script>
        </body>

        </html>