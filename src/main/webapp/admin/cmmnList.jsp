<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../member/isAdmin.jsp"%>
<!DOCTYPE html>
<html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Document</title>

        <style>
            .boxA {
                margin-top: 50px;
                /* border: 1px solid black; */
            }

            .boxA:after {
                content: "";
                display: block;
                clear: both;
            }

            .boxB {
                border: 1px solid black;
                float: left;
                margin: 5px;
                min-width: 600px;
                max-width: 600px;
                min-height: 500px;
                width: 50%;
            }

            .boxC {

                /* border: 1px solid red;*/
                min-width: 600px;
                max-width: 1200px;
                min-height: 500px;

            }

            #thirdTable>tbody>tr>th {
                text-align: right;

            }

            .w-100px {
                width: 100px !important;
            }

            .w-200px {
                width: 200px !important;
            }
        </style>

    </head>



    <body>
    	<%@ include file="../inc/header_inc.jsp"%>
		<%@ include file="../inc/header.jsp"%>
        <div class="container">
            <div class="boxA">
                <div class="boxB">
                    <div class="d-flex justify-content-end">
                        <button class="btn btn-info">+</button>
                        <button class="btn btn-danger">-</button>
                    </div>
                    <table class="table table-hover" id="firstTable">
                        <thead class="text-center">
                            <tr>
                                <th>코드</th>
                                <th>코드명</th>
                                <th>사용여부</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    SE100
                                </td>
                                <td>
                                    좌석상태
                                </td>
                                <td>
                                    <select name="useYn" id="" disabled>
                                        <option value="Y" selected>사용</option>
                                        <option value="N">미사용</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>

                <div class="boxB">
                    <div class="d-flex justify-content-end">
                        <button class="btn btn-info">+</button>
                        <button class="btn btn-danger">-</button>
                    </div>
                    <table class="table table-hover" id="">
                        <thead>
                            <tr>
                                <th>코드</th>
                                <th>코드명</th>
                                <th>사용여부</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    SE101
                                </td>
                                <td>
                                    이용가능
                                </td>
                                <td>
                                    <select class="form-select w-100px" name="useYn" id="">
                                        <option value="Y" selected>사용</option>
                                        <option value="N">미사용</option>

                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    SE102
                                </td>
                                <td>
                                    이용중
                                </td>
                                <td>
                                    <select class="form-select w-100px" name="useYn" id="" disabled>
                                        <option value="Y" selected>사용</option>
                                        <option value="N">미사용</option>

                                    </select>
                                </td>
                            </tr>

                        </tbody>
                    </table>

                </div>
            </div>
            <div class="boxC">
                <table class="table table-hover table-striped" id="thirdTable">

                    <colgroup>
                        <col width=20%>
                        <col width=*>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>상위코드</th>
                            <td><input class="form-control w-200px" type="text" value="" readonly></td>
                        </tr>
                        <tr>
                            <th>코드</th>
                            <td><input class="form-control w-200px" type="text" value="SE100" readonly></td>
                        </tr>
                        <tr>
                            <th>코드명</th>
                            <td><input class="form-control w-200px" type="text" value="좌석상태"></td>
                        </tr>
                        <tr>
                            <th>사용여부</th>
                            <td> <select class="form-select w-100px" name="useYn" id="">
                                    <option value="Y" selected>사용</option>
                                    <option value="N">미사용</option>

                                </select></td>
                        </tr>
                        <tr>
                            <th>설명</th>
                            <td><textarea class="form-control" name="" id="" cols="100"
                                    rows="5">좌석의 상태를 나타내는 상위코드입니다.</textarea></td>
                        </tr>
                    </tbody>
                </table>
                <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                    <button class="btn btn-primary me-md-2" type="button">수정</button>
                    <button class="btn btn-primary" type="button">삭제</button>
                </div>
            </div>
        </div>
    </body>

</html>