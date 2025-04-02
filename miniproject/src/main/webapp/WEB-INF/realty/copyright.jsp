<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="common_path" value="${pageContext.request.contextPath}/resources" />
<div class="copyright">
  <ol>
    <li>
      <img src="${common_path}/logo/e_click_logo.png" class="logos">
    </li>
    <li>
      <ul>
        <li>회사소개</li>
        <li>이용약관</li>
        <li>위치기반서비스 약관</li>
        <li>제휴문의</li>
        <li>개인정보처리방침</li>
        <li>신고센터</li>
      </ul>
    </li>
    <li>
      <ul>
        <li>저작권규약</li>
        <li>책임한계 및 법적고지</li>
        <li>이메일 무단수집거부</li>
        <li>고객센터문의</li>
        <li></li>
        <li></li>
      </ul>
    </li>
    <li>
      <ul>
        <li>${corpinfoDTO.getCompany_name()} | 대표 : ${corpinfoDTO.getCeo_name()}</li>
        <li>${corpinfoDTO.getAddress()}</li>
        <li>사업자번호 : ${corpinfoDTO.getBiz_reg_no()} | 통신판매업 : ${corpinfoDTO.getTelecom_sales_no()}</li>
        <li>정보보호책임자 : ${corpinfoDTO.getPrivacy_officer ()}</li>
        <li>영업문의 : ${corpinfoDTO.getSales_contact()}</li>
        <li>팩스번호 : ${corpinfoDTO.getFax_number()}</li>
      </ul>
    </li>
  </ol>
</div>