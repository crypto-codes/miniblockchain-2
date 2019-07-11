# blockchain lite
require 'blockchain-lite'

b0 = Block.first( 'Genesis' )
b1 = Block.next( b0, 'Transaction Data...' )
b2 = Block.next( b1, 'Transaction Data...' )
b3 = Block.next( b2, 'Transaction Data...' )

blockchain = [b0, b1, b2, b3]

pp blockchain