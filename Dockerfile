# 使用官方的 Go 镜像作为构建阶段
FROM dockerpull.com/golang:1.20-alpine AS builder

# 设置工作目录
WORKDIR /app

# 将本地的所有文件复制到容器中
COPY . .

# 编译 Go 程序为静态链接的二进制文件
RUN go build -o ip-service

# 使用更轻量的基础镜像
FROM alpine:latest

# 创建一个非root用户
RUN adduser -D -g '' appuser

# 从构建阶段复制已编译的二进制文件到运行镜像
COPY --from=builder /app/ip-service /app/ip-service

# 切换为非root用户
USER appuser

# 暴露应用运行的端口
EXPOSE 8080

# 启动服务
CMD ["/app/ip-service"]
