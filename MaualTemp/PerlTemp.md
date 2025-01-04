## 19. Perl 数据库连接

​	Perl 5 中可以使用 DBI（Database Independent Interface，数据库独立接口）模块连接数据库。DBI 作为 Perl 语言中和数据库进行通讯的标准接口，它定义了一系列的方法，变量和常量，提供一个和具体数据库平台无关的数据库持久层。

### 19.1. DBI 结构

​	DBI 和具体数据库平台无关，可以将其应用在 Oracle，MySQL 或 Informix 等数据库中。DBI 获取所有 API（Application Programming Interface）发送的 SQL 数据，然后分发到对应的驱动上执行，最后再获取数据返回。

#### 19.1.1. 变量名约束

> `$dsn`			驱动程序对象句柄
>
> `$dbh`			一个数据库对象的句柄
>
> `$sth`			一个语句或者一个查询对象的句柄
>
> `$h`				通用的句柄（`$dbh`，`$sth`，`$drh`），依赖于上下文
>
> `$rc`			  操作代码返回的布尔值（true 或 false）
>
> `$rv`			  操作代码返回的整数值
>
> `@ary`			查询返回的一行值的数组
>
> `$rows`		  操作代码返回的行数值
>
> `$fh`			  文件句柄
>
> `undef`		  NULL 值表示未定义
>
> `\%attr`		引用属性的哈希值并传到方法上

### 19.2. 数据库连接

#### 19.2.1. 操作

- 使用 `prepare()` API 预处理 SQL 语句；
- 使用 `execute()` API 执行 SQL 语句；
- 使用 `finish()` API 释放语句句柄；
- 使用 `commit()` 提交以上执行操作。

#### 19.2.2. 使用 do 语句

​	`do` 语句可以执行 UPDATE，INSERT，DELETE 操作，执行成功返回 true，执行失败返回 false。

```perl
$dbh->do('SQL');
```

#### 19.2.3. COMMIT 操作

​	`commit` 为提交事务，完成数据库的操作。

```perl
$dbh->commit or die $dbh->errstr;
```

#### 19.2.4. ROLLBACK 操作

​	如果执行 SQL 期间发生错误，可以回滚数据，不做任何改变。

```perl
$dbh->rollback or die $dbh->errstr;
```

#### 19.2.5. 事务

##### 连接数据库时开始

```perl
$dbh = DBI -> connect($dsn, $userid, $password, {AutoCommit => 0}) or die $DBI::errstr;
```

​	以上代码在连接时设置了 `AutoCommit = 0`，也就是说当对数据库进行更新操作时，它不会自动地把那些更新直接写到数据库里，而是需要程序通过 `$dbh->commit` 来使数据真正地写入到数据库里，或 `$dbh->rollback` 来回滚刚才的操作。

##### 通过语句开始

​	这种方式不需要在连接数据库时设置 `AutoCommit = 0`，可以在一次数据库连接，进行多次事务操作，不用每一次事务的开始都去连接一次数据库。

```perl
$rc = $dbh->begin_work or die $dbh->errstr;

####################
##这里执行一些 SQL 操作
####################

# 成功后操作
$dbh->commit;
# 失败后回滚
$dbh->rollback;
```

##### 断开数据库连接

```perl
$rc = $dbh->disconnect or warn $dbh->errstr;
```

## 20. Perl CGI 编程

​	CGI（Common Gateway Interface），通用网关接口，它是一段程序，运行在服务器上，提供同客户端 HTML 页面的接口。

### 20.1. Web 服务器配置

​	配置 Apache 支持 CGI 配置。

```conf
ScriptAlias /cgi-bin/ /var/www/cgi-bin/
```

​	在 `AddHandler` 中添加 `.pl` 后缀，这样就可以访问 `.pl` 结尾的 Perl 脚本文件。

```conf
AddHandler cgi-script .cgi .pl .py
```

### 20.2. HTTP 头部

​	HTTP 头部用于放松给浏览器，并告诉浏览器文件的内容类型。

```perl
print "HTTP <head>: <content>"
```

| 头                    | 描述                                                        |
| --------------------- | ----------------------------------------------------------- |
| `Content-type`        | 请求的与实体对应的 MIME 信息                                |
| `Expirse: Date`       | 响应过期的日期和时间                                        |
| `Location: URL`       | 用来重定向接受方到非请求 URL 的位置来完成请求或标识新的资源 |
| `Last-modified: Date` | 请求资源的最后修改时间                                      |
| `Content-length: N`   | 请求的内容长度                                              |
| `Set-Cookie: String`  | 设置 HTTP Cookies                                           |

#### 20.3. 文件下载

​	如果想要通过 Perl CGI 实现文件下载，需要设置不同的头部信息。

```perl
# HTTP Header
print "Content-Type:application/octet-stream; name=\"FileName\"\r\n";
print "Content-Dispostion: attachment; filename=\"FileName\"\r\n\n";

# Actual File Content will go hear.
open(FILE, "<FileName");
while(read(FILE, $buffer, 100))
{
	print("$buffer");
}
```

