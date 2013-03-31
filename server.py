from twisted.internet.protocol import Factory, Protocol
from twisted.internet import reactor

class CatanServer(Protocol):
	def connectionmade(self):
		print "Someone connected"
factory = Factory()
factory.protocol = CatanServer
reactor.listenTCP(80, factory)
print "a server started"
reactor.run()
