<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row">
	<div style="text-align:center">
		<c:choose>
			<c:when test="${not empty Employee}">
				<h3 style="text-transform: uppercase">Chi tiết nhân viên</h3>
			</c:when>
			<c:otherwise>
				<h3 style="text-transform: uppercase">Thêm mới nhân viên</h3>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="form-group">
		<label>Tên nhân viên</label>
		<c:choose>
			<c:when test="${not empty Employee}">
				<input type="text" class="form-control" id="txtNameEmployee" disabled="disabled" value="${Employee.name}"/>
			</c:when>
			<c:otherwise>
				<input type="text" class="form-control" id="txtNameEmployee"/>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="form-group">
		<label>Email nhân viên</label>
		<c:choose>
			<c:when test="${not empty Employee}">
				<input type="text" class="form-control" id="txtPhoneEmployee" disabled="disabled" value="${Employee.email}"/>
			</c:when>
			<c:otherwise>
				<input type="text" class="form-control" id="txtPhoneEmployee"/>
			</c:otherwise>
		</c:choose>
	</div>
	
	
	<div class="form-group">
		<label>Số điện thoại nhân viên</label>
		<c:choose>
			<c:when test="${not empty Employee}">
				<input type="text" class="form-control" id="txtPhoneEmployee" disabled="disabled" value="${Employee.phone}"/>
			</c:when>
			<c:otherwise>
				<input type="text" class="form-control" id="txtPhoneEmployee"/>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="form-group" style="text-align: center;">
		<c:choose>
			<c:when test="${not empty Employee}">
				<button class="btn btn-success" onclick="newEmployee(); return false;" disabled="disabled">Thêm nhân viên mới</button>
			</c:when>
			<c:otherwise>
				<button class="btn btn-success" onclick="newEmployee(); return false;">Thêm mới nhân viên</button>
			</c:otherwise>
		</c:choose>
	</div>
</div>