
object Main extends App {
  println(s"Runtime.getRuntime.maxMemory(): ${Runtime.getRuntime.maxMemory()}")
  println(s"Runtime.getRuntime.totalMemory(): ${Runtime.getRuntime.totalMemory()}")
  println(s"Runtime.getRuntime.availableProcessors(): ${Runtime.getRuntime.availableProcessors()}")
}
