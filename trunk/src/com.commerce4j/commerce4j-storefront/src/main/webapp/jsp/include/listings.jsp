<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="view" value="${param.view}" />
<c:if test="${view eq null}">
	<c:set var="view" value="list" />	
</c:if>


<c:if test="${listings ne null}">

<div class="container">

<!-- listings view -->
<table>
<tr>
<td class="smaller" valign="middle">
Mostrar como
</td>
<td>
<a href="${request.requestURI}?aid=${param.aid}&c=${param.c}&view=list"><img src="images/application_view_list.png" alt="" /></a>
<a href="${request.requestURI}?aid=${param.aid}&c=${param.c}&view=tile"><img src="images/application_view_tile.png" alt="" /></a>
</td>
</tr>
</table>

<c:choose>
<c:when test="${view eq 'list'}">
	<table class="listings" width="100%" cellspacing="0">
		
		<tr>
			<th width="120">Imagen</th>
			<th>T&iacute;tulo / Descripci&oacute;n</th>
			<th width="100">Precio</th>
			<th>&nbsp;</th>
		</tr>
	
		<c:set var="count" value="0"/>
		<c:forEach items='${listings}'  var="item" varStatus="status">
		<tr>
			<td valign="top" align="center">
				<img src="images/img_not_available.png" />
			</td>
			<td valign="top">
				<c:out value="${item.itemTitle}" />
				<div class="gray smaller">
					<c:out value="${item.itemDesc}" />
				</div>
			</td>
			<td>
				<c:out value="${item.currency.currencyAbrev}" />
				<c:out value="${item.currency.currencySymbol}" />
				<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${item.itemPrice}"    />
			</td>
			<td align="center">
				<input type="button" value="Comprar" />
			</td>
		</tr>
		<c:if test="${status.last}">
	      <c:set var="count" value="${status.count}"/>
	    </c:if>
		</c:forEach>
		
		<c:if test="${count eq 0}">
		<tr>
		<td colspan="4">No se encontraron productos para esta categor&iacute;a</td>
		</tr>
		</c:if>
	</table>
</c:when>

<c:when test="${view eq 'tile'}">

	<table class="listings" width="100%" cellspacing="0" border="0">
		<c:forEach items='${listings}' var="item" varStatus="status">
		
		<c:if test="${status.count eq 1 or status.count mod 5 eq 0}"><%="<tr>"%></c:if>
		
			<td width="25%" valign="top" align="center">
			
				<img src="images/img_not_available.png" />
				<br/>
				<c:out value="${item.itemTitle}" />
				<br/><br/>
				<c:out value="${item.currency.currencyAbrev}" />
				<c:out value="${item.currency.currencySymbol}" />
				<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${item.itemPrice}"    />
				<br/>
				<input type="button" value="Comprar" />
			</td>
		
		<c:if test="${status.count mod 5 eq 0}"><%="</tr>"%></c:if>
		
		</c:forEach>
	</table>
	

</c:when>
</c:choose>

</div>
</c:if>