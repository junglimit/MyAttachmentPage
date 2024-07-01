<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <link rel="stylesheet" href="/assets/css/shop-header.css" />
    <link rel="stylesheet" href="/assets/css/payment.css" />
    <script src="/assets/js/category.js/" defer></script>
  </head>
  <body>
    <!-- header  -->
    <%@ include file="../include/header.jsp" %>

    <!-- main -->
    <main>
      <section class="payment">
        <form action="/payment" method="post" enctype="multipart/form-data">
          <div class="inner">
            <div class="payment-title">
              <p>주문결제</p>
            </div>

            <!-- 주문상품 -->
            <div class="payment-item">
              <p class="payment-sub-title">주문상품<span></span></p>
              <ul class="prd-box-list">
                <li class="prd-box">
                  <div class="prd-item"><div class="item-img"></div></div>
                  <div class="prd-item-info">
                    <p class="prdName">아이템명</p>
                    <p>수량:3개</p>
                    <p class="prdPrice"><span>19,000</span>원</p>
                  </div>
                </li>
                <li class="prd-box">
                  <div class="prd-item"><div class="item-img"></div></div>
                  <div class="prd-item-info">
                    <p class="prdName">아이템명</p>
                    <p>수량:2개</p>
                    <p class="prdPrice"><span>19,000</span>원</p>
                  </div>
                </li>
                <li class="prd-box">
                  <div class="prd-item"><div class="item-img"></div></div>
                  <div class="prd-item-info">
                    <p class="prdName">아이템명</p>
                    <p>수량:1개</p>
                    <p class="prdPrice"><span>19,000</span>원</p>
                  </div>
                </li>
              </ul>
            </div>

            <!-- 배송지 -->

            <div class="payment-Delivery">
              <p class="payment-sub-title">배송지<span></span></p>
              <div class="tr">
                <p class="th-title">주문자<span class="icoRequired"></span></p>
                <input
                  type="text"
                  id="account"
                  class="user-name"
                  placeholder="주문자를 입력하세요"
                  name="name"
                />
                <p class="th-accountSub"></p>
              </div>
              <div class="tr">
                <p class="th-title">이메일<span></span></p>
                <input
                  type="text"
                  class="user-email"
                  placeholder="이메일을 작성하세요"
                  name="email"
                />
                <p class="th-passwordSub1"></p>
              </div>
              <div class="tr">
                <p class="th-title">주소<span></span></p>

                <div class="postal-code">
                  <input
                    type="text"
                    class="postal-code"
                    placeholder="우편번호를 작성하세요"
                    name="email"
                  />
                  <button class="postal-code-search">주소검색</button>
                </div>

                <input
                  type="text"
                  class="postal-code"
                  placeholder="기본주소 작성"
                  name="email"
                />

                <input
                  type="text"
                  class="postal-code"
                  placeholder="상세주소 작성"
                  name="email"
                />

                <p class="th-passwordSub1"></p>
              </div>
            </div>

            <!-- 포인트 사용 -->

            <div class="user-point">
              <p class="payment-sub-title">포인트<span></span></p>
              <div class="tr">
                <p class="th-title">
                  포인트 결제<span class="icoRequired"></span>
                </p>
                <div class="user-point-input">
                  <input
                    type="text"
                    id="account"
                    class="user-name"
                    placeholder="사용할 포인트를 입력하세요"
                    name="name"
                  />
                  <button class="btn-point">적용</button>
                </div>
                <p class="user-point-info">
                  <span>보유하신 포인트</span>: 2000
                </p>
              </div>
            </div>

            <!-- 결제 정보 -->

            <div class="order-price-info">
              <p class="payment-sub-title">결제 정보<span></span></p>
              <div class="tr">
                <div class="price-info">
                  <p class="th-title">주문상품</p>
                  <p>259,400원</p>
                </div>
                <div class="price-info">
                  <p class="th-title">포인트 사용</p>
                  <p>0원</p>
                </div>
                <div class="price-info">
                  <p class="th-title">배송비</p>
                  <p>+ 0원</p>
                </div>
                <div class="price-info">
                  <p class="th-title">최종 금액</p>
                  <p class="total-price">259,400원</p>
                </div>
              </div>
            </div>

            <a class="btn-pay" href="#">12,000원 결제하기</a>
          </div>
        </form>
      </section>
    </main>
    <%@ include file="../include/footer.jsp" %>
  </body>
</html>