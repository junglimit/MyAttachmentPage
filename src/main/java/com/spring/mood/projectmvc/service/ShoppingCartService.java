package com.spring.mood.projectmvc.service;

import com.spring.mood.projectmvc.dto.responseDto.ShoppingCartResponseDto;
import com.spring.mood.projectmvc.entity.ShoppingCart;
import com.spring.mood.projectmvc.mapper.ShoppingCartMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class ShoppingCartService {
    private final ShoppingCartMapper shoppingCartMapper;

    @Transactional
    public void addToCart(Long itemId, int itemPrice, int quantity, String userAccount) {
        ShoppingCart existingCart = shoppingCartMapper.findItemByUserAccountAndItemId(userAccount, itemId);

        if (existingCart != null) { // 기존의 장바구니가 이미 아이템이 있을경우
            Long newQuantity = existingCart.getCartTotalCount() + quantity; // 총 개수 추가
            int newTotalPrice = existingCart.getCartTotalPrice() + (itemPrice * quantity); // 총 가격 추가

            existingCart.setCartTotalCount(newQuantity); // 기존의 총 개수 setter 로 변경
            existingCart.setCartTotalPrice(newTotalPrice); // 기존의 총 가격 setter 로 변경

            boolean updated = shoppingCartMapper.update(existingCart); // 업데이트

            if (!updated) {
                throw new RuntimeException("장바구니 아이템을 업데이트하는 중 오류가 발생했습니다.");
            }

            log.info("업데이트된 장바구니 아이템: {}", existingCart);

        } else { // 기존의 장바구니가 null 일 경우
            ShoppingCart shoppingCart = new ShoppingCart(); // 새로운 장바구니를 만듬
            shoppingCart.setUserAccount(userAccount);
            shoppingCart.setShopItemId(itemId);
            shoppingCart.setCartTotalPrice(itemPrice * quantity);
            shoppingCart.setCartTotalCount(quantity);

            log.info("장바구니에 추가: {}", shoppingCart);

            boolean saved = shoppingCartMapper.save(shoppingCart);

            if (!saved) {
                throw new RuntimeException("장바구니에 상품을 추가하는 중 오류가 발생했습니다.");
            }
        }
    }

    @Transactional
    public void updateCartItem(String userAccount, Long itemId, int quantity, int totalPrice) {
        ShoppingCart existingCart = shoppingCartMapper.findItemByUserAccountAndItemId(userAccount, itemId);

        if (existingCart != null) {
            existingCart.setCartTotalCount(quantity);
            existingCart.setCartTotalPrice(totalPrice);

            boolean updated = shoppingCartMapper.update(existingCart);
            if (!updated) {
                throw new RuntimeException("장바구니 아이템을 업데이트하는 중 오류가 발생했습니다.");
            }

            log.info("업데이트된 장바구니 아이템: {}", existingCart);
        } else {
            throw new RuntimeException("장바구니 아이템이 존재하지 않습니다.");
        }
    }

    public List<ShoppingCartResponseDto> getCartByUser(String userAccount) {
        return shoppingCartMapper.findByUserAccount(userAccount).stream()
                .map(ShoppingCartResponseDto::fromEntity)
                .collect(Collectors.toList());
    }

    @Transactional
    public void removeFromCart(Long itemId, String userAccount) {
        ShoppingCart existingCart = shoppingCartMapper.findItemByUserAccountAndItemId(userAccount, itemId);
        if (existingCart != null) {
            boolean deleted = shoppingCartMapper.delete(existingCart.getCartId());
            if (!deleted) {
                throw new RuntimeException("장바구니 아이템을 제거하는 중 오류가 발생했습니다.");
            }
            log.info("제거된 장바구니 아이템: {}", existingCart);
        } else {
            throw new RuntimeException("제거할 장바구니 아이템이 존재하지 않습니다.");
        }
    }

    public void clearCart(String userAccount) {
        shoppingCartMapper.deleteByUserAccount(userAccount);
    }
}

