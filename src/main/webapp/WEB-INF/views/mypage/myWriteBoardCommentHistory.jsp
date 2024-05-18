<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardList.css">
	
			<div id="innerContainer" class="flex-grow-1">
			    <table class="table table-sm table-bordered">
			        <c:forEach var="boardComment" items="${boardCommentList}">
			            <ul class="question_list">
			                <li class="li mb-3">
			                    <a class="" href="${pageContext.request.contextPath}/board/boardDetail?boId=${boardComment.boId}">
									<h3 style="margin-bottom: 20px;">게시글 번호 : ${boardComment.boId}</h1>
			                        <p class="question_body" style="margin-left: 20px;">${boardComment.bocContents}</p>
			
			                        <div class="id_date_info d-flex ss">
			                            <div class="me-3">${boardComment.acId}</div>
			                            <div id="formattedDate">
			                                <fmt:formatDate value="${boardComment.bocNewdate}" pattern="yy-MM-dd HH:mm:ss" />
			                            </div>
			                        </div>
			
			                        <div class="question_info_footer d-flex ss">
			                            <div class="ss footer_icon me-1">
			                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path
                                                    d="M225.8 468.2l-2.5-2.3L48.1 303.2C17.4 274.7 0 234.7 0 192.8v-3.3c0-70.4 50-130.8 119.2-144C158.6 37.9 198.9 47 231 69.6c9 6.4 17.4 13.8 25 22.3c4.2-4.8 8.7-9.2 13.5-13.3c3.7-3.2 7.5-6.2 11.5-9c0 0 0 0 0 0C313.1 47 353.4 37.9 392.8 45.4C462 58.6 512 119.1 512 189.5v3.3c0 41.9-17.4 81.9-48.1 110.4L288.7 465.9l-2.5 2.3c-8.2 7.6-19 11.9-30.2 11.9s-22-4.2-30.2-11.9zM239.1 145c-.4-.3-.7-.7-1-1.1l-17.8-20c0 0-.1-.1-.1-.1c0 0 0 0 0 0c-23.1-25.9-58-37.7-92-31.2C81.6 101.5 48 142.1 48 189.5v3.3c0 28.5 11.9 55.8 32.8 75.2L256 430.7 431.2 268c20.9-19.4 32.8-46.7 32.8-75.2v-3.3c0-47.3-33.6-88-80.1-96.9c-34-6.5-69 5.4-92 31.2c0 0 0 0-.1 .1s0 0-.1 .1l-17.8 20c-.3 .4-.7 .7-1 1.1c-4.5 4.5-10.6 7-16.9 7s-12.4-2.5-16.9-7z" /></svg>
			                            </div>
			
			                            <div class="me-2" id="boLike">${boardComment.bocLike}</div>
			
			                        </div>
			
			                    </a>
			                </li>
			            </ul>
			          <hr/>
			        </c:forEach>
			    </table>
			

				<table class="table text-center">
				    <tr>
				        <td colspan="4">
				            <div>
				                <a class="btn btn-sm" href="javascript:myWriteBoardCommentHistory(1)">처음</a>
								<c:if test="${pager.groupNo>1}">
			                     	<a class="btn btn-sm" href="javascript:myWriteBoardCommentHistory(${pager.startPageNo-1})">이전</a>
			                	</c:if>
				                <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				                    <c:if test="${pager.pageNo != i}">
				                        <a class="btn btn-sm" href="javascript:myWriteBoardCommentHistory(${i})">${i}</a>
				                    </c:if>
				                    
				                    <c:if test="${pager.pageNo == i}">
				                        <a class="btn btn-outline-primary btn-sm" href="javascript:myWriteBoardCommentHistory(${i})">${i}</a>
				                    </c:if>
				                </c:forEach>
				                <c:if test="${pager.groupNo<pager.totalGroupNo}">
									<a class="btn btn-sm" href="javascript:myWriteBoardCommentHistory(${pager.endPageNo+1})">다음</a>
			                	</c:if>
				                
				                <a class="btn btn-sm" href="javascript:myWriteBoardCommentHistory(${pager.totalPageNo})">맨끝</a>
				            </div>
				        </td>
				    </tr>
				</table>
			</div>
			
