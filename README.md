#   C h i e n o w a _ H W M  
  
 * * C o n t r o l   P C B A   V e r s i o n   1 . 1 0   T e s t   R e p o r t * *  
  
 P r o b l e m   i n   t h i s   v e r s i o n  
  
 C h a n g e   i n   n e x t   v e r s i o n  
  
 \ 1 .       C o m p o n e n t :  
  
 �         C a p a c i t o r   C 6 ,   C 7 ,   C 1 7 ,   C 1 8   a r e   T M K 3 2 5 A B J 4 7 6 M M   b u t   w e   b u y   E D H 4 7 6 M 0 5 0 A 9 H A A   - >   D o   n o t   f i t   t h e   f o o t p r i n t   - >   C h a n g e   f o o t p r i n t   t o   E D H 4 7 6 M 0 5 0 A 9 H A A  
  
 �         D i o d e   z e n e r   D 4 2   i s   B Z X 8 4 B 5 V 1 L Y F H T 1 1 6   b u t   w e   b u y   R B 1 6 0 M - 3 0 T R   - >   D o n  t   f i t   t h e   f o o t p r i n t   - >   R e p l a c e   f o o t p r i n t   t o   R B 1 6 0 M - 3 0 T R  
  
 �         S o m e   c o n n e c t o r   w a s   m o u n t e d   w r o n g   d i r e c t i o n .   - >   N o t e   f o r   P C B A  
  
 �         2   P o w e r   s u p p l y   m o d u l e   w i t h o u t   c a s e   - >   C h a n g e   t o   n o - c a s e   m o d u l e  
  
 �         N C 7 S Z 0 5 P 5 X   o u t p u t   i s   o p e n - d r a i n   ( F l o w   s e n s o r   s i g n a l )   - >   A d d   p u l l - u p   r e s i s t o r  
  
 \ 2 .       S c h e m a t i c  
  
 �         S o m e   p i n   i s   o p e n - d r a i n   ( P 6 0 - P 6 3 )   - >   C a n   n o t   o u t p u t   d i r e c t l y   5 V   t o   d r i v e   T L P 2 4 1   - >   C h a n g e   t h e   w i r i n g ,   a l l   p i n   w i l l   b e   s i n k   o u t p u t .  
  
 �         I C 2 1   -   I C L 3 2 3 2 C V Z   ( R S 2 3 2 )   d i d   n o t   c o n n e c t   t o   5 V   p o w e r   s u p p l y   - >   F i x   t h e   s c h e m a t i c  
  
 �         J 2 8      U A R T   c o n n e c t o r ,   p i n   2   d i d   n o t   c o n n e c t   t o   G N D   - >   F i x   t h e   s c h e m a t i c  
  
 �         P 1 3 0   c a n   o n l y   O U T P U T   - >   C h a n g e   C V C C _ A L A R M _ I N   t o   C V C C _ A L A R M _ R E S E T   a n d   v i c e   v e r s a  
  
 \ 3 .       P e r i p h e r a l   c o n n e c t i o n :  
  
 �         U A R T :   O K  
  
 �         R S 4 8 5 / R S 2 3 2 :   H a v e   s i g n a l  
  
 �         E E P R O M :   O K  
  
 �         A n a l o g   I / O :   O K  
 