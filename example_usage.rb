require 'rubygems'
require 'bloops'
require 'blu'

b = Bloops.new
b.tempo = 180

pogo = Blu.load(b, "blus/pogo.blu")

b.tune pogo, "C A E"

b.play
sleep 0.01 while not b.stopped?