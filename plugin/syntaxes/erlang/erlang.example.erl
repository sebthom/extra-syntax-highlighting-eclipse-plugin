%% 1. Module Declaration and Export
-module(example).
-export([hello/0, add/2, factorial/1, tuple_example/0, list_sum/1, start_worker/0, safe_divide/2, create_user/0]).

%% 2. Basic Functions
hello() ->
    io:format("Hello, Erlang!~n").

%% 3. Functions with Parameters
add(A, B) ->
    A + B.

%% 4. Recursive Function (Factorial)
factorial(0) -> 1;
factorial(N) when N > 0 -> N * factorial(N - 1).

%% 5. Tuples
tuple_example() ->
    User = {name, "Alice", age, 30},
    io:format("User: ~p~n", [User]).

%% 6. Lists and Recursion
list_sum([]) -> 0;
list_sum([Head | Tail]) ->
    Head + list_sum(Tail).

%% 7. Message Passing and Concurrency
start_worker() ->
    Pid = spawn(fun worker/0),
    Pid ! {self(), "Hello, Worker!"},
    receive
        Response -> io:format("Received: ~p~n", [Response])
    end.

worker() ->
    receive
        {Sender, Message} ->
            io:format("Worker received: ~p~n", [Message]),
            Sender ! "Message received"
    end.

%% 8. Pattern Matching with Records
-record(user, {name, age, email}).

create_user() ->
    #user{name = "Bob", age = 25, email = "bob@example.com"}.

show_user(User) ->
    io:format("User: ~s, Age: ~p, Email: ~s~n", [User#user.name, User#user.age, User#user.email]).

%% 9. Error Handling with try-catch
safe_divide(_, 0) -> {error, "Cannot divide by zero"};
safe_divide(A, B) -> {ok, A / B}.
