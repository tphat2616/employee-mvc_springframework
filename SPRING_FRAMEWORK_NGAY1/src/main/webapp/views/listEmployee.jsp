<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class = "row" style="text-align:center">
	<h3 style="text-transform: uppercase"> Danh sách nhân viên</h3>
</div>
<c:if test="${not empty listEmployee }">
	<table class="table table-hover table-striped">
		<thead>
			<tr>
				<th>Mã</th>
				<th>Tên nhân viên</th>
				<th>Email</th>
				<th>Số điện thoại</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="rs" items="${listEmployee}">
				<tr>
					<td>${rs.id}</td>
					<td><a href="#" data-id="${rs.id}" onclick="detailEmployee(this);return false;">${rs.name}</a></td>
					<td>${rs.email}</td>
					<td>${rs.phone}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</c:if>