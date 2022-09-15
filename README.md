<h1 align=center> REPOPROVAS </h1>

<h2 align=center> WHAT IS IT? </h2>
<p align=center> This app is a system for students to share tests!</p>

<h2 align=center> HOW DOES THE API WORKS? </h2>

```
TO SIGN UP:
HTTP request method: .POST('/signup');
req object expects:
    body: email, password, confirmPassword;
```

```
TO LOGIN:
HTTP request method: .POST('/login');
req object expects:
    body: email, password, confirmPassword;
```

```
TO CREATE TEST:
HTTP request method: .POST('/tests');
req object expects:
    headers: { "Authorization": "Bearer $token" };
    body: name, pdfUrl, categoryId, teacherId, disciplineId;
```

```
TO GET TESTS BY DISCIPLINE:
HTTP request method: .GET('/tests/disciplines');
req object expects:
    headers: { "Authorization": "Bearer $token" };
```

```
TO GET TESTS BY TEACHERS:
HTTP request method: .GET('/tests/teachers');
req object expects:
    headers: { "Authorization": "Bearer $token" };
```
