#PROBLEMA FILÓSOFOS
#El programa muestra los cambios en las actividades de los filósofos
#Por lo tanto, el programa no muestra en cada paso la actividad actual de cada filósofo

import threading
import time

num = 5
cubiertos = [threading.Semaphore(1) for i in range(num)]

class Philosopher(threading.Thread):  
    def __init__(self, idnt, stopevent):
        threading.Thread.__init__(self)
        self.idnt = idnt
        self.stopevent=stopevent

    def run(self):
        while not stopevent.is_set():
            #el proceso por el cual pasa cada filósofo es:
			self.pensar()
            self.tomarcubiertos()
            self.comer()
            self.soltarcubiertos()

	#La actividad inicial que realiza cada filósofo es pensar
    def pensar(self):
        print "La actividad actual del filósofo %d  es pensar \n" % self.idnt
        time.sleep(1)
    
    def tomarcubiertos(self):
        #Cuando el filósofo es par
        if (self.idnt % 2 == 0):
            cubiertoderecho = cubiertos[self.idnt]
            cubiertoizqquierdo = cubiertos[(self.idnt + 1) % num]
        
		#Cuando el filósofo es impar
        else:
            cubiertoderecho = cubiertos[(self.idnt + 1) % num]
            cubiertoizqquierdo = cubiertos[self.idnt]
        #El filósofo toma el cubierto, mismo que está disponible
		cubiertoderecho.acquire()
        print "El filósofo %d tiene su primer cubierto \n" % self.idnt
        time.sleep(1)
        #El filósofo toma el cubierto, mismo que está disponible
		cubiertoizqquierdo.acquire()
        print "El filósofo %d ahora tiene dos cubiertos \n" % self.idnt
        time.sleep(1)

	#El filósofo teminó de comer
	#El filósofo ya no tiene hambre
    def soltarcubiertos(self):        
		#El filósofo procede a soltar los cubiertos, volviéndolos disponibles 
		cubiertos[(self.idnt + 1) % num].release()
        cubiertos[self.idnt].release()
       
	#El filosofo cambia de actividad a pensar
        print "El filósofo %d realiza la actividad pensar \n" % self.idnt
        time.sleep(1)

	#El filosofo tiene los dos cubiertos, por lo tanto se dispone a comer
    def comer(self):
        print "La actividad actual del filósofo %d es comer \n" % self.idnt
        time.sleep(1)

stopevent = threading.Event()
#Control de errores y bucles
filosofos = [Philosopher(i, stopevent) for i in range(5)]
for f in filosofos:
    f.start()
time.sleep(10)
stopevent.set()
for f in filosofos:
    f.join()
print "Se ha terminado el turno (Ejecución del programa finalizada)"
