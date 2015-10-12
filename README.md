# RAW_socket

##構造体の解説
1. struct ifreq  
2. struct ether_header  
3. struct iphdr  
4. struct sockaddr_ll  

###ifreq
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
