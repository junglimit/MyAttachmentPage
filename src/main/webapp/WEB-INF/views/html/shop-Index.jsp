<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>상품 목록</title>
  <link rel="stylesheet" href="/assets/css/shop-index.css">
  <link rel="stylesheet" href="/assets/css/shop-header.css"/>
  <link rel="stylesheet" href="/assets/css/footer.css"/>
  <script src="https://kit.fontawesome.com/a9dfb46732.js" crossorigin="anonymous"></script>
</head>
<body>
  <%@ include file="../include/header.jsp" %>
<main>
  <div class="inner">
    
      <div class="container">
        <c:choose>
          <c:when test="${sessionScope.loginUser != null}">
            <a href="/cart">
              <i class="fas fa-cart-shopping"></i>
            </a>
          </c:when>
          <c:otherwise>
            <a href="javascript:void(0);" onclick="showFailModal()">
              <i class="fas fa-cart-shopping"></i>
            </a>
          </c:otherwise>
        </c:choose>
        <div class="search-container">
          <c:if test="${userRole == 'ROLE_admin'}">
            <button class="item-add" onclick="location.href='/shop/add'">Add Item</button>
          </c:if>
          <form action="/shop" method="get">
            <input placeholder="Title" type="text" name="keyword" class="search-bar">
            <button type="submit" class="item-search">Search</button>
          </form>
        </div>
        <div class="main-container">
    
          <ul>
            <c:forEach var="item" items="${items}">
              <li>
                <c:if test="${userRole == 'ROLE_admin'}">
                  <button class="delete-btn" onclick="confirmDeletion('${item.shopItemId}')">X</button>
                </c:if>
                <p>${item.shopItemDesc}</p>
                <div class="img-box">
                  <a href="/shop/${item.shopItemId}">
                    <img src="${item.shopItemImg}" alt="${item.shopItemName}">
                  </a>
                </div>
                <span>${item.shopItemName}</span>
                <form id="addToCartForm-${item.shopItemId}" action="/cart" method="post" onsubmit="return handleFormSubmit(event, '${item.shopItemId}')">
                  <div class="addBtn">
                    <input type="hidden" name="itemId" value="${item.shopItemId}">
                    <input type="hidden" name="itemPrice" id="itemPrice-${item.shopItemId}" value="${item.shopItemPrice}">
                    <c:choose>
                      <c:when test="${sessionScope.loginUser != null}">
                        <input type="hidden" name="userAccount" value="${sessionScope.loginUser.account}">
                      </c:when>
                      <c:otherwise>
                        <input type="hidden" name="userAccount" value="">
                      </c:otherwise>
                    </c:choose>
                    <input type="hidden" name="quantity" value="1">
                    <button id="cart-btn-${item.shopItemId}">₩ ${item.shopItemPrice}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add to cart</button>
                  </div>
                </form>
              </li>
            </c:forEach>
          </ul>
        </div>
        <%@ include file="../include/footer.jsp" %>
        <!-- 모달 HTML 코드 -->
        <div id="cartModal" class="modal">
          <div class="modal-content">
              <span class="close" onclick="closeModal()">&times;</span>
              <p id="modalMessage">장바구니에 추가되었습니다.</p>
              <button id="modalButton" onclick="goToCart()">Go to Cart</button>
              <button onclick="goBack()">Back</button>
          </div>
      </div>
  </div>
</main>
  </div>
  <script src="/assets/js/category.js"></script>
  <script src="/assets/js/shop-index.js"></script>
  
</body>
</html>
