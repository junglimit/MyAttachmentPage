package com.spring.mood.projectmvc.mapper;

import com.spring.mood.projectmvc.dto.requestDto.AutoSignInDto;
import com.spring.mood.projectmvc.entity.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

    boolean save(Member member);

    Member findOne(String userAccount);

    boolean delete(String userAccount);

    boolean checkId(String account);

    boolean checkEmail(String email);

    //자동로그인 쿠키값, 만료시간 업데이트
    void updateAutoLogin(AutoSignInDto dto);

    //세션아이디로 회원정보 조회
    Member findUserBySessionId (String sessionId);
}
