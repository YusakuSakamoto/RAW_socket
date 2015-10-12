# RAW_socket

##構造体の解説
1. struct ifreq  
2. struct sockaddr  
3. struct ether\_header  
4. struct iphdr  
5. struct sockaddr\_ll  

##1.ifreq
[MAN PAGE](http://linuxjm.osdn.jp/html/LDP_man-pages/man7/netdevice.7.html)  


要約  
union(共用体)を用いて、どのデータであっても同じメモリ領域を使用できるようにしている。
実際に使用しているのは、関数ioctlにおいて、
```
ioctl(sockfd, SIOCGIFINDEX, &if_idx)
```
ここでは、ifNameをifreq構造体のifr\_nameにコピーしている.

SIOCGIFINDEXは、インターフェースの interface index を取得し、 ifr_ifindex に入れて返す。
interface indexは、成功すれば1~4の値が入っている。  
- loのinterface indexは1  
- eth\*のinterface indexは2  
- wlan\*のinterface indexは3  


```
ioctl(sockfd, SIOCGIFHWADDR, &if_mac)
```
SIOCGIFHWADDRは、デバイスのハードウェアアドレスを ifr\_hwaddr を用いて取得・設定する。 ハードウェアアドレスは sockaddr 構造体に設定される。 sa\_family には ARPHRD\_* デバイスタイプが入り、 sa_data にはバイト 0 から始まる L2 ハードウェアアドレスが入る。 ハードウェアアドレスの設定は特権が必要な操作である。  

```
ioctl(sockfd, SIOCGIFADDR, &if_ip)
```
SIOCGIFADDRは、ifr_addr を用いてデバイスのアドレスの設定/取得を行う。 インターフェースのアドレスの設定は特権(root)が必要な操作である。 互換性確保のため、設定/取得ができるのは AF_INET アドレスだけである。  

####AF_INET
AF_INETは、PF_INET(IPv4 インターネット・プロトコル)

##2.sockaddr
[筑波大学 システム情報工学研究科 解説ページ](http://www.coins.tsukuba.ac.jp/~syspro/2010/No6_files/sockaddr.html)

| type         | element    |
|--------      |--------    |
|unsigned short|sa_family   |
|char          |sa_data[14] |

##3.ether\_header
| type         | element   | explain                |
|--------      |--------   |--------                |
|unsigned char |ether_shost|Source MAC address.     |
|unsigned char |ether_dhost|Destination MAC address.|
|unsigned short|sa_family  |Protocol type.          |

##4.iphdr

##5.sockaddr\_ll


#参考
[TCP/IPソケットプログラミング C言語編](http://www.amazon.co.jp/TCP-IP%E3%82%BD%E3%82%B1%E3%83%83%E3%83%88%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0-C%E8%A8%80%E8%AA%9E%E7%B7%A8-Michael-Donahoo/dp/4274065197)  
[socket() で使用するアドレス・ファミリー・プロトコル](https://publib.boulder.ibm.com/html/as400/v4r5/ic2962/info/RZAB6ADDFAM.HTM)  
[ファイヤープロジェクト](http://www.fireproject.jp/feature/c-language/socket/basic.html)  
[IPヘッダを理解する](http://qiita.com/Ki4mTaria/items/188df29ca26dbdc7887c)  

