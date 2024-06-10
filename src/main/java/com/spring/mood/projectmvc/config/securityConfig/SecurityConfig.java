package com.spring.mood.projectmvc.config.securityConfig;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@EnableWebSecurity // 시큐리티 설정 파일
public class SecurityConfig {

    //시큐리티 기본 설정 ( 인증 인가 처리, 초기 로그인화면 없애기 )
    @Bean // @Component와 같음 @Controller, @service, @repository, @mapper 등
    //Bean은 내가 안 만든 클래스를 스프링한테 주입시키는 아노테이션임.
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        //모든 요청에 대해 인증하지 않겠다.
        http.csrf().disable() // csrf 토큰공격방지 기능 off //모든 요청에 대해 인증하지 않겠다.
                .authorizeHttpRequests().antMatchers("/**").permitAll();
        return http.build();
    }

    //비밀번호를 인코딩하는 객체를 스프링 컨테이너에 등록
    @Bean
    public PasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }

}

