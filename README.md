# aliyun-ossutil-docker

- https://github.com/aliyun/ossutil
- https://hub.docker.com/r/qyvlik/aliyun-ossutil

## ossutil config file

`.ossutilconfig` example

```ini
[Credentials]
language=EN
endpoint=oss-cn-hangzhou.aliyuncs.com
accessKeyID=L***A
accessKeySecret=B***8
```

## sync file form oss

```bash
docker run --rm -it \
  -v "./.ossutilconfig:/home/www/.ossutilconfig" \
  -v "./data:/data"
  qyvlik/aliyun-ossutil:1.7.13 \
  ossutil \
    sync \
    oss://examplebucket \
    /data
```

- [同步OSS文件到本地](https://help.aliyun.com/document_detail/256352.html)
