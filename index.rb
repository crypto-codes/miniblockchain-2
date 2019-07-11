# Eric Manganaro - A blockchain in ruby

# import our libraries
# sha256 algo
require "digest"
require "pp"

# output all the transactions

# initialize

class Block
	attr_reader :index
	attr_reader :timestamp
	attr_reader :data
	attr_reader :previous_hash
	attr_reader :nonce
	attr_reader :hash

# index
# timestamp
# transaction - data
# previous hash
# hashing - hash
		
	def initialize(index,data,previous_hash)
		@index 			= index
		@timestamp 		= Time.now
		@data 			= data
		@previous_hash 	= previous_hash
		@nonce,@hash 	= compute_hash_with_proof_of_work
	end

	def compute_hash_with_proof_of_work(difficulty ="00")
		nonce = 0
		loop do
			hash = compute_hash_with_nonce(nonce)
			#proof of work
			if hash.start_with?(difficulty)
					return[nonce,hash] #Do  Doo loops
			else
				nonce += 1
			end
		end
	end

	def compute_hash_with_nonce(nonce = 0)
		#instantiate sha so we can use its methods!
		sha = Digest::SHA256.new

		# bringing all the data from the block headers  and concatenating them all together 
		# and passing them as the input argument of SHA256
		#
		sha.update(nonce.to_s + @index.to_s + @timestamp.to_s + @data.to_s + @previous_hash)
		## This is amazing now
		sha.hexdigest
	end

	##create the genesis block
	def self.first(data= "Genesis")
		Block.new(0,data,"0")
	end

	def self.next(previous,data="Transactions or something")
		Block.new(previous.index + 1,data,previous.hash)
	end # JUST ONE BUT DOES IT KEEP GOING ON
end
b0 = Block.first("ITS THE FIRST FREAKING BLOCK EVERR")
b1 = Block.next(b0,"Buy Spaghetti and put it in a bag")
b2 = Block.next(b1,"Bought darkweb albuterol inhalers")
b3 = Block.next(b2,"Books on cooking")

#### DUN DUN DUN DUN DUN ITS a BLOCKCHAIN
# an OVERHYPED LINKED LIST - WOW

blockchain = [b0,b1,b2,b3]

pp blockchain

# computing the hash with proof of work

# calc_hash_with_nonce
# we need derive the header of the block from somewhere

# genesis block (first BLOCK)

# next block

# creating the block transactions

# -- INSERT --
=begin
this is multi comment 
=end