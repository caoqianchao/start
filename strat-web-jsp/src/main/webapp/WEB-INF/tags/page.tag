<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ attribute name="page" rtexprvalue="true" required="true" type="com.ecpss.directsettle.qservice.utils.Pager"
              description="分页对象Pager" %>
<%@ attribute name="info" rtexprvalue="true" required="false" type="java.lang.Boolean" description="是否显示分页信息（记录总数，页面总数，当前第几页）" %>
<%@ attribute name="go" rtexprvalue="true" required="false" type="java.lang.Boolean" description="跳转到" %>
<%@ attribute name="pageCount" rtexprvalue="true" required="false" type="java.lang.Boolean" description="每页显示数量(10 20 30 ...默认20)" %>
<%@ attribute name="pagenum" required="false" type="java.lang.Integer" description="显示页码数量，如5（1,2,3,4,5) 3(2,3,4)" %>
<div style="float: right;padding-top: 0px;margin-top: 0px;" class="pagination">
    <c:if test="${empty info}">
        <c:set scope="page" value="true" var="info"></c:set>
    </c:if>
    <c:if test="${empty go}">
        <c:set scope="page" value="true" var="go"></c:set>
    </c:if>
    <c:if test="${empty pageCount}">
        <c:set scope="page" value="true" var="pageCount"></c:set>
    </c:if>
    <c:if test="${empty pagenum}">
        <c:set scope="page" value="5" var="pagenum"></c:set>
    </c:if>

    <ul>
        <c:if test="${page.totalCount>0}">
            <c:if test="${info}">
                <li><a>共<font color="red">${page.totalCount}</font>条</a></li>
            </c:if>
            <c:if test="${go}">
                <li><input type="number" placeholder="页码" style="width:50px;text-align:center;float:left" id="toGoPage"
                           value="${page.pageNO}"></li>
                <li style="cursor:pointer;"><a class="btn btn-mini btn-success" onclick="toTZ();">跳转</a></li>
            </c:if>
            <c:choose>
                <c:when test="${pagenum%2==0 }">
                    <c:set var="half" value="${pagenum/2}"></c:set>
                    <c:set var="left" value="${half-1}"></c:set>
                    <c:set var="right" value="${half}"></c:set>
                </c:when><c:otherwise>
                    <c:set var="half" value="${(pagenum+1)/2}"></c:set>
                    <c:set var="left" value="${half-1}"></c:set>
                    <c:set var="right" value="${left}"></c:set>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${page.firstPage}">
                    <li><a>首页</a></li>
                </c:when><c:otherwise>
                    <li style="cursor: pointer;"><a onclick="nextPage(1)">首页</a></li>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${page.prePage!=page.pageNO}">
                    <li style="cursor: pointer;"><a onclick="nextPage(${page.pageNO-1})">上页</a></li>
                </c:when>
            </c:choose>

            <c:choose>
                <c:when test="${page.pageNO <= half}">
                    <c:forEach begin="1" end="${page.pageNO}" var="s">
                        <c:choose>
                            <c:when test="${s eq page.pageNO}">
                                <li><a><font color="#808080">${s}</font> </a></li>
                            </c:when><c:otherwise>
                            <li style="cursor: pointer;"><a onclick="nextPage(${s})">${s}</a></li>
                        </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:forEach begin="${page.pageNO+1}" end="${page.totalPage>=pagenum?pagenum:page.totalPage}" var="s">
                        <li style="cursor: pointer;"><a onclick="nextPage(${s})">${s}</a></li>
                    </c:forEach>
                    <c:if test="${page.totalPage > pagenum}">
                        <li><a>……</a></li>
                    </c:if>
                </c:when><c:otherwise>
                <li><a>……</a></li>
                <c:choose>
                    <c:when test="${page.pageNO+right <= page.totalPage}">
                        <c:forEach begin="${page.pageNO-left}" end="${page.pageNO}" var="s">
                            <c:choose>
                                <c:when test="${s eq page.pageNO}">
                                    <li><a><font color="#808080">${s}</font> </a></li>
                                </c:when><c:otherwise>
                                <li style="cursor: pointer;"><a onclick="nextPage(${s})">${s}</a></li>
                            </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:when><c:otherwise>
                        <c:forEach begin="${page.totalPage+1-pagenum >= 1?page.totalPage+1-pagenum:1}" end="${page.pageNO}" var="s">
                            <c:choose>
                                <c:when test="${s eq page.pageNO}">
                                    <li><a><font color="#808080">${s}</font> </a></li>
                                </c:when><c:otherwise>
                                <li style="cursor: pointer;"><a onclick="nextPage(${s})">${s}</a></li>
                            </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                <c:forEach begin="${page.pageNO+1}" end="${page.pageNO+right <= page.totalPage?page.pageNO+right:page.totalPage}" var="s">
                    <li style="cursor: pointer;"><a onclick="nextPage(${s})">${s}</a></li>
                </c:forEach>
                <c:if test="${page.totalPage > page.pageNO+right}">
                    <li><a>……</a></li>
                </c:if>
            </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${!page.lastPage}">
                    <li style="cursor: pointer;"><a onclick="nextPage(${page.pageNO+1})">下页</a></li>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${page.pageNO eq page.totalPage}">
                    <li><a>尾页</a></li>
                </c:when><c:otherwise>
                    <li style="cursor: pointer;"><a onclick="nextPage(${page.totalPage})">尾页</a></li>
                </c:otherwise>
            </c:choose>

            <c:if test="${info}">
                <li><a>第${page.pageNO}页</a></li>
                <li><a>共${page.totalPage}页</a></li>
            </c:if>

            <c:if test="${pageCount}">
                <li>
                    <select title="显示条数" style="width: 55px;float: left" id="pageSize" onchange="changeCount(this.value)">
                        <option value="${page.pageSize}">${page.pageSize}</option>
                        <option value="10">10</option>
                        <option value="20">20</option>
                        <option value="30">30</option>
                        <option value="40">40</option>
                        <option value="50">50</option>
                        <option value="60">60</option>
                        <option value="70">70</option>
                        <option value="80">80</option>
                        <option value="90">90</option>
                    </select>
                </li>
            </c:if>
        </c:if>

    </ul>
    <script type="text/javascript">
        //换页函数
        function nextPage(page) {
            var pageSize = $("#pageSize").val();
//            top.jzts();
            if (true && document.forms[0]) {
                var url = document.forms[0].getAttribute("action");
                if (url.indexOf('?') > -1) {
                    url += "&pageNO=";
                } else {
                    url += "?pageNO=";
                }
                url = url + page + "&pageSize=" + pageSize + "";
                document.forms[0].action = url;
                document.forms[0].submit();
            } else {
                var url = document.location + '';
                if (url.indexOf('?') > -1) {
                    if (url.indexOf('pageNO') > -1) {
                        var reg = /pageNO=\d*/g;
                        url = url.replace(reg, 'pageNO=');
                    } else {
                        url += "&pageNO=";
                    }
                } else {
                    url += "?pageNO=";
                }
                url = url + page + "&pageSize=" + pageSize + "";
                document.location = url;
            }
        }

        //调整每页显示条数
        function changeCount(value) {
//            top.jzts();
            if (true && document.forms[0]) {
                var url = document.forms[0].getAttribute("action");
                if (url.indexOf('?') > -1) {
                    url += "&pageNO=";
                } else {
                    url += "?pageNO=";
                }
                url = url + "1&pageSize=" + value;
                document.forms[0].action = url;
                document.forms[0].submit();
            } else {
                var url = document.location + '';
                if (url.indexOf("?")) {
                    if (url.indexOf('pageNO') > -1) {
                        var reg = /currentPage=\d*/g;
                        url = url.replace(reg, 'pageNO=');
                    } else {
                        url += "1&pageNO=";
                    }
                } else {
                    url += "?pageNO=";
                }
                url = url + "&pageSize=" + value;
                document.location = url;
            }
        }

        //跳转函数
        function toTZ() {
            var toPaggeVlue = document.getElementById("toGoPage").value;
            if (toPaggeVlue == '') {
                document.getElementById("toGoPage").value = 1;
                return;
            }
            if (isNaN(Number(toPaggeVlue))) {
                document.getElementById("toGoPage").value = 1;
                return;
            }
            nextPage(toPaggeVlue);
        }
    </script>
</div>
