from twisted.internet.protocol import Factory, Protocol
from twisted.internet import reactor

class CatanServer(Protocol):
	def connectionMade(self):
		self.factory.clients.append(self)
		print "Someone is ", self.factory.clients
	def connectionLost(self, reason):
		self.factory.clients.remove(self)
	def dataReceived(self, data):
		a = data.split(':')
		print a
		if len(a) > 1:
			command = a[0]
			content = a[1]
			msg = ""
		if command == "roll":
			self.name = content
			msg = self.name + " has rollled a " + c0ment
			if content == "7";
			msg = self.name"you can move robber"
		elif commang == "place":
			msg = self.name + " Is placing Sttlement" + content
			print msg
		for c in self.factory.clinets:
			c.message(msg)
	def message(self, message):
		self.transport.write(message + '\n')
factory = Factory()
factory.clients = []
factory.protocol = CatanServer
reactor.listenTCP(80, factory)
print "A Catan Server Started"
reactor.run()
