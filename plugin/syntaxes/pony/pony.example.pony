actor Main
  // 1. Entry point
  new create(env: Env) =>
    env.out.print("Hello, Pony!")

    // Calling basic functions
    let result = add(5, 3)
    env.out.print("5 + 3 = " + result.string())

    // Calling a function with pattern matching
    let msg = describe_number(0)
    env.out.print(msg)

    // Calling a recursive function
    let fact = factorial(5)
    env.out.print("Factorial of 5: " + fact.string())

    // Tuple example
    let tuple = tuple_example()
    env.out.print("Tuple: (" + tuple._1.string() + ", " + tuple._2 + ")")

    // List and sum example
    let nums = [I64(1); I64(2); I64(3); I64(4)]
    let sum = sum_list(nums)
    env.out.print("Sum of list: " + sum.string())

    // Safe division using error handling
    try
      let result = safe_divide(10, 0)
      env.out.print(result.string())
    else
      env.out.print("Division by zero error")
    end

  // 2. Functions with parameters and return type
  fun add(a: I64, b: I64): I64 =>
    a + b

  // 3. Pattern Matching with Union types
  fun describe_number(n: I64): String =>
    match n
    | 0 => "Zero"
    | 1 => "One"
    | _ => "Other"
    end

  // 4. Recursive Function
  fun factorial(n: I64): I64 =>
    if n == 0 then
      1
    else
      n * factorial(n - 1)
    end

  // 5. Tuples
  fun tuple_example(): (I64, String) =>
    (42, "Answer")

  // 6. Lists and Iteration (Pony's Array)
  fun sum_list(nums: Array[I64]): I64 =>
    var sum: I64 = 0
    for num in nums do
      sum = sum + num
    end
    sum

  // 7. Error Handling with try-catch
  fun safe_divide(a: I64, b: I64): I64 ?
    if b == 0 then
      error
    else
      a / b
    end

  // 8. Actors and Concurrency
  fun start_worker() =>
    let worker = Worker
    worker.start(self)

  be _msg_received(msg: String) =>
    env.out.print("Received message: " + msg)

actor Worker
  be start(main: Main) =>
    main._msg_received("Worker started")
