<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ȩ�׶��� �۰� ��û</title>
<link rel="stylesheet" href="/css/authorList.css">
    <style>
        .authorlist-wrap {
            display: flex;
            justify-content: space-around;
        }

        .author-reg-bottom {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/layout/top.jsp" flush="true"/>

    <div class="authorlist-wrap">
        <span>�� ��ȣ</span>
        <span>�ۼ���</span>
        <span>�ۼ��ð�</span>
    </div>

    <div class="author-reg-bottom">
        <a class="author-reg" href="/authorInsert">�۰� ����ϱ�</a>
    </div>

</body>
</html>