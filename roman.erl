-module(roman).
-export([convert/1, run/0]).
 
val($M) ->
    1000;
val($D) ->
    500;
val($C) ->
    100;
val($L) ->
    50;
val($X) ->
    10;
val($V) ->
    5;
val($I) ->
    1.
 
 
convert(Str) ->
    convert(Str, 0).
 
convert([], Acc) ->
    Acc;
convert([X], Acc) ->
    Acc + val(X);
convert([X, Y | Rest], Acc) ->
    {F, N} = {val(X), val(Y)},
    case F < N of
        true ->
            convert(Rest, Acc + (N - F));
        _ ->
            convert([Y | Rest], Acc + F)
    end.
 
run() ->
    [convert(X) || X <- ["MCMLIV", "MCMXC", "XXXIII", "CXLVII", "CCCLXV", 
			 "XCIV", "CCLXXXIX", "LXXVIII", "CCLVI", "CCCXCV", 
			 "CCXXVIII", "MCMXCVII", "CDLXXII", "DCCCXCVIII", 
			 "MMX", "DCCLXIX", "MMMDXLVIII", "MMCMLXXI"]].
