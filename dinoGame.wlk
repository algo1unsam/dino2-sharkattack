import wollok.game.*

const velocidad = 250

object juego{

	method configurar(){
		game.width(12)
		game.height(8)
		game.title("Dino Game")
		game.boardGround("fondo.png")
		game.addVisual(suelo)
		game.addVisual(cactus)
		game.addVisual(dino)
		game.addVisual(reloj)
		keyboard.space().onPressDo{ self.jugar()}
		game.onCollideDo(dino,{ obstaculo => obstaculo.chocar()})
		
	} 
	
	method iniciar(){
		dino.iniciar()
		reloj.iniciar()
		cactus.iniciar()
	}
	
	method jugar(){
		if (dino.estaVivo()) 
			dino.saltar()
		else {
			game.removeVisual(gameOver)
			self.iniciar()
		}
		
	}
	
	method terminar(){
		game.addVisual(gameOver)
		cactus.detener()
		reloj.detener()
		dino.morir()
	}
	
}

object gameOver {
	method position() = game.center()
	method text() = "GAME OVER"
}

object reloj {
	var property tiempo = 0 
	method text() = tiempo.toString()
  //method textColor() = "00FF00FF"
	method position() = game.at(1, game.height()-1)
	
	method pasarTiempo() {
<<<<<<< HEAD
		tiempo +=1
		//COMPLETAR
=======
		tiempo = tiempo + 1
>>>>>>> e2abd9e2b3bf453f0730751ec2e37d98b3631386
	}
	method iniciar(){
		tiempo = 0
		game.onTick(100,"tiempo",{self.pasarTiempo()})
	}
	method detener(){
		if(!dino.estaVivo()){
			tiempo.stop()
		}
		//COMPLETAR
	}
}

object cactus {
	var property position = self.posicionInicial()

	method image() = "cactus.png"
	method posicionInicial() = game.at(game.width()-1,suelo.position().y())

	method iniciar(){
		position = self.posicionInicial()
		game.onTick(velocidad,"moverCactus",{self.mover()})
	}
	
	method mover(){
		if(self.position().x() == 0){
			position = self.position().right(13)
		}
		else position = self.position().left(1)
		//COMPLETAR
	}
	
	method chocar(){
		/*if(game.onCollideDo(dino, { algo => algo.teEncontro(pepita) })){

		}*/
		//COMPLETAR
	}
    method detener(){
		//COMPLETAR
	}
}

object suelo{

	method position() = game.origin().up(1)
	method image() = "suelo.png"
}


object dino {
	var vivo = true
	var property position = game.at(1,suelo.position().y())
	
	method image() = "dino.png"
	
	method saltar(){
<<<<<<< HEAD
		self.subir()
		self.bajar()
		position = 

		/*if(self.position().y() == suelo.position().y()){
			keyboard.space().onPressDo{(self.subir())}
		}
		game.onTick(1000,"bajar",{self.bajar()})*/
		//position = self.position()
		//COMPLETAR
=======
>>>>>>> e2abd9e2b3bf453f0730751ec2e37d98b3631386
	}
	
	method subir(){
		position = position.up(1)
	}
	
	method bajar(){
		if(self.position().y()!=suelo.position().y()){
			position = position.down(1)
		}
		
	}
	method morir(){
		game.say(self,"¡Auch!")
		vivo = false
	}
	method iniciar() {
		vivo = true
	}
	method estaVivo() {
		return vivo
	}
}
