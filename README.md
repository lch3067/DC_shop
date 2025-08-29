<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
test work
=======
=======
<<<<<<< HEAD
test work
=======
=======
>>>>>>> d0a31d40dff59a71f15c549e832381f00ee6486d
>>>>>>> 93f47c71138d52e702947cfa466aae2d62d1d345
=======
# DCShop 프로젝트

## 프로젝트 개요
DCShop는 반려동물 관련 커뮤니티 및 쇼핑몰 서비스입니다.

## 주요 기능
- 회원 관리 (가입, 로그인, 마이페이지)
- 게시판 (자유, 꿀팁, 리뷰, 질문)
- 반려동물 정보 관리
- 쇼핑몰
- 추천 시스템
>>>>>>> 01f78def7c24c41499462131d7ee3997ccc871a6
-----------------------------------------------------xml-------------------------------------------------------

xml 설정시 확인



1\. web.xml



src/main/resources/dataSource-config.xml 작성

&nbsp;	    => web.xml에 등록해야 함 

&nbsp;	    <context-param>

&nbsp;			<param-name>contextConfigLocation</param-name>

&nbsp;			<param-value>

&nbsp;						classpath:/dataSource-config.xml  <!-- 추가해야 작동  -->

&nbsp;			</param-value>

&nbsp;		</context-param>



2\. pom.xml



<!-- Mybatis 설정 시작 -->

&nbsp;		<!-- 컨넥션풀 -->

&nbsp;		<bean id="dataSource" class="org.springframework.jndi.JndiObjectFactoryBean">

&nbsp;			<property name="jndiName" value="java:comp/env/jdbc/jsp\_pj\_ict05" />

&nbsp;			<property name="resourceRef" value="true" />

&nbsp;		</bean>

&nbsp;		

&nbsp;		<!-- Mybatis 파일 위치 지정, 컨넥션풀 -->

&nbsp;		<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">

&nbsp;			<property name="dataSource" ref="dataSource" />

&nbsp;			<property name="mapperLocations" value="classpath:mappers/\*\*/\*.xml" />  

&nbsp;		</bean>

&nbsp;		

&nbsp;		<!-- 생성자 DI이며, sqlSession이 참조변수 -->

&nbsp;		<bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate">

&nbsp;			<constructor-arg ref="sqlSessionFactory" />

&nbsp;		</bean>

&nbsp;		

&nbsp;		<!-- Mybatis 설정 종료 -->



3\. dataSource-config.xml



<!-- Mybatis 설정 시작 pom.xml에 jar파일 먼저 추가 -->

&nbsp;	<!-- 컨넥션풀 -->

&nbsp;	<bean id="dataSource" class="org.springframework.jndi.JndiObjectFactoryBean">

&nbsp;		<property name="jndiName" value="java:comp/env/jdbc/dc\_shop" />

&nbsp;		<property name="resourceRef" value="true" />

&nbsp;	</bean>

&nbsp;	

&nbsp;	<!-- Mybatis 파일 위치 지정, 컨넥션풀 -->

&nbsp;	<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">

&nbsp;		<property name="dataSource" ref="dataSource" />

&nbsp;		<property name="mapperLocations" value="classpath:mappers/\*\*/\*.xml" />  

&nbsp;	</bean>

&nbsp;	

&nbsp;	<!-- 생성자 DI이며, sqlSession이 참조변수 -->

&nbsp;	<bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate">

&nbsp;		<constructor-arg ref="sqlSessionFactory" />

&nbsp;	</bean>

&nbsp;	

&nbsp;	<!-- Mybatis 설정 종료 -->

jdbc 서버 네이밍 확인



4\. (예시파일)customerMapper.xml

맵퍼파일



5\. Servers -> context.xml



<Resource 

&nbsp;      author="Container" 

&nbsp;      driverClassName="oracle.jdbc.driver.OracleDriver" 

&nbsp;      maxActive="8" 

&nbsp;      maxWait="1000" 

&nbsp;      name="jdbc/dc\_shop" 

&nbsp;      password="pet" 

&nbsp;      type="javax.sql.DataSource" 

&nbsp;      url="jdbc:oracle:thin:@localhost:1521/xe" 

&nbsp;      username="dc\_shop"/>

서버주소

------------------------------------------------------------------------------------------------------------------------

<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> f0ce842999b23c7f4bb130891ded042a128b9270
=======
<<<<<<< HEAD
>>>>>>> f0ce842999b23c7f4bb130891ded042a128b9270
=======
>>>>>>> d0a31d40dff59a71f15c549e832381f00ee6486d
>>>>>>> 93f47c71138d52e702947cfa466aae2d62d1d345
=======
## 기술 스택
- Spring Framework 5.1.8
- MyBatis
- Oracle Database
- JSP/Servlet
- jQuery
- CSS3

## 개발 환경
- Java 11
- Eclipse IDE
- Tomcat Server
>>>>>>> 01f78def7c24c41499462131d7ee3997ccc871a6
