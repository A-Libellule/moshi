-module(anagram).
-export([run/1]).

run(Words) ->
    run(Words, []).
run([], Acc) ->
    Acc;
run([Word | Rest], Acc) ->
    {ToAcc, Rest2} = findall(Word, Rest, {[Word], []}),
    run(Rest2, [ToAcc | Acc]).

findall(Word, [], Acc) ->
    Acc;
findall(Word, [X | Rest], {Yes, No}) ->
    case anagram(Word, X) of
	true ->
	    findall(Word, Rest, {[X | Yes], No});
	false ->
	    findall(Word, Rest, {Yes, [X | No]})
    end.

anagram(Word, Comp) ->
    WordDict = hist(Word, dict:new()),
    CompDict = hist(Comp, dict:new()),
    WordDict =:= CompDict.

hist([], Dict) ->
    Dict;
hist([X | Rest], Dict) ->
    Dict2 = dict:update(X, 
			fun(Y) ->
				Y + 1
			end,
			1,
			Dict),
    hist(Rest, Dict2).
