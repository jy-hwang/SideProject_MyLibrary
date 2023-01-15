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

		<link rel="stylesheet" type="text/css" href="../resources/css/cmmnList.css" />
		
				
    </head>



    <body>
    	<%@ include file="../inc/header_inc.jsp"%>
		<%@ include file="../inc/header.jsp"%>
        <div class="container">
            <div class="boxA">
                <div class="boxB">
                    <div class="d-flex justify-content-end">
                        <button class="btn btn-info" id="plusLeftCode">+</button>
                        <button class="btn btn-danger" id="minusLeftCode">-</button>
                    </div>
                    <table class="table table-hover" id="leftCodeTable">
                        <thead>
                            <tr>
                                <th>코드</th>
                                <th>코드명</th>
                                <th>사용여부</th>
                            </tr>
                        </thead>
                        <tbody>
                         	<c:choose>
								<c:when test="${ empty cmmnList }">
									<tr>
										<td colspan="3" align="center">조회된 코드가 없습니다^^*</td>
									</tr>
								</c:when>
		                         <c:otherwise>
		                         	<c:forEach items="${cmmnList }" var="row" varStatus="loop">
		                           <tr>
		                                <td>${row.cmmnCode}</td>
		                                <td>
		                                    ${row.cmmnName}
		                                </td>
		                                <td>
		                                	<c:choose>
												<c:when test ="${row.useYn eq 'Y' }">사용</c:when>
												<c:otherwise>미사용</c:otherwise>
											</c:choose>
		                                </td>
		                            </tr>
		                          	</c:forEach>
		                         </c:otherwise>
		                     </c:choose>
                        </tbody>
                    </table>

                </div>

                <div class="boxB">
                    <div class="d-flex justify-content-end">
                        <button class="btn btn-info" id="plusRightCode">+</button>
                        <button class="btn btn-danger" id="minusRightCode">-</button>
                    </div>
                    <table class="table table-hover" id="rightCodeTable">
                        <thead>
                            <tr>
                                <th>코드</th>
                                <th>코드명</th>
                                <th>사용여부</th>
                            </tr>
                        </thead>
                        <tbody>
                            
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
                            <td><input class="form-control w-200px" type="text" name="parentCode" value="" readonly></td>
                        </tr>
                        <tr>
                            <th>코드</th>
                            <td><input class="form-control w-200px" type="text" name="cmmnCode" value="SE100" readonly></td>
                        </tr>
                        <tr>
                            <th>코드명</th>
                            <td><input class="form-control w-200px" type="text" name="cmmnName" value="좌석상태"></td>
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
                            <td><textarea class="form-control" name="description" id="" cols="100"
                                    rows="5">좌석의 상태를 나타내는 상위코드입니다.</textarea></td>
                        </tr>
                    </tbody>
                </table>
                <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                    <button class="btn btn-primary" type="button" id="btnInsertCmmn">추가</button>
                    <button class="btn btn-info" type="button" id="btnModifyCmmn">수정</button>
                </div>
            </div>
        </div>
    </body>
	<script type="text/javascript">
		$(function(){
			var count = 0;
			 	$('#plusLeftCode').click(function() {
			 		if(count == 0 ){
				    	$('#leftCodeTable > tbody:last').append('<tr><td>코드</td><td>코드명</td><td><select class="form-select w-100px" name="useYn" id="" disabled><option value="Y" selected>사용</option><option value="N">미사용</option></select></td></tr>');
				    	count += 1;
			 		}else{
			 			alert("앞의 작업을 먼저 저장하거나 취소하세요");
			 		}
				});
				
			 	$('#minusLeftCode').click(function() {
			 		if(count==1){
						$('#leftCodeTable > tbody > tr:last').remove();
						count -= 1;
			 		}else{
			 			alert("삭제할 행이 없습니다.")
			 		}
				});
			
			 	$('#plusRightCode').click(function() {
			 		if(count == 0 ){
				    	$('#rightCodeTable > tbody:last').append('<tr><td>코드</td><td>코드명</td><td><select class="form-select w-100px" name="useYn" id="" disabled><option value="Y" selected>사용</option><option value="N">미사용</option></select></td></tr>');
				    	count += 1;
			 		}else{
			 			alert("앞의 작업을 먼저 저장하거나 취소하세요");
			 		}
				});
				
			 	$('#minusRightCode').click(function() {
			 		if(count==1){
						$('#rightCodeTable > tbody > tr:last').remove();
						count -= 1;
			 		}else{
			 			alert("삭제할 행이 없습니다.")
			 		}
				});
			 	
			 	$('#leftCodeTable tbody').on('click','tr',function(e){
			 		// 현재 클릭된 Row(<tr>)
					var tr = $(this);
					var td = tr.children();
					var parentCode = td.eq(0).text();
					var cmmnCode = td.eq(0).text();
					
					$.ajax({
						
						url : "/cmmnChildList.ajax",
						type : "get",
						datatype : "application/x-json;charset=UTF-8",
						data : {parentCode:parentCode},
						success:function(json){
							$("#rightCodeTable > tbody").empty();
							console.log(json);
							var str = '';
							$.each(json,function(i){
							str += '<tr>';
							str += '<td>' + json[i].cmmnCode + '</td><td>'	+  json[i].cmmnName + '</td><td>'
							
							              + (json[i].useYn == 'Y' ? '사용' : '미사용') + '</td>';
							              
							str += '</tr>';
							});
							console.log(str);
							$("#rightCodeTable > tbody").append(str);
							
							
							
						}, error : function(e){
							console.log(e);
							alert("error!");
						}
						
					});
					
					
					$.ajax({
						
						url : "/cmmnOneCode.ajax",
						type : "get",
						datatype : "application/x-json;charset=UTF-8",
						data : {cmmnCode:cmmnCode},
						success : function(json){
							var thirdTable = $("#thirdTable > tbody");
							thirdTable.parentCode = json.parentCode;
							thirdTable.cmmnCode = json.parentCode;
							thirdTable.cmmnName = json.parentCode;
							thirdTable.useYn = json.useYn;
							thirdTable.description = json.description;
						}	,
						error : function(e){
							console.log(e)
						}
						
					});
					
					
					
				
			 	});
			 	
		});
		</script>

</html>