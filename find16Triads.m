function [triad,em] = find16Triads( entry,dataEpinion)
% findFFpp function will return the number of the FFpp triads

triad=zeros(4,5);
from=entry(1,1);
to=entry(1,2);
find1=find(dataEpinion(:,1)==from);
fromNeiOut=dataEpinion(dataEpinion(:,1)==from,2);

find2=find(dataEpinion(:,2)==from);
fromNeiIn=dataEpinion(dataEpinion(:,2)==from,1);

find3=find(dataEpinion(:,1)==to);
toNeiOut=dataEpinion(dataEpinion(:,1)==to,2);

find4=find(dataEpinion(:,2)==to);
toNeiIn=dataEpinion(dataEpinion(:,2)==to,1);
%% find the FF 
[c,ia,ib]=intersect(fromNeiOut,toNeiIn);
triad(1,1)=length(c);
if ~isempty(c)
    for i=1:length(c)
%         disp(dataEpinion(find1(ia(i)),3)>0);
%         disp(size(dataEpinion(find4(ib(i)),3),1));
        if (dataEpinion(find1(ia(i)),3)>0) && (dataEpinion(find4(ib(i)),3)>0)
            triad(1,2)=triad(1,2)+1;
        else if (dataEpinion(find1(ia(i)),3)<0) && (dataEpinion(find4(ib(i)),3)>0)
                triad(1,3)=triad(1,3)+1;
            else if (dataEpinion(find1(ia(i)),3)<0) && (dataEpinion(find4(ib(i)),3)<0)
                    triad(1,4)=triad(1,4)+1;
                else if (dataEpinion(find1(ia(i)),3)>0) && (dataEpinion(find4(ib(i)),3)<0)
                        triad(1,5)=triad(1,5)+1;
                    end
                end
            end
        end
    end
end

%% find the BB
[c2,ia2,ib2]=intersect(fromNeiIn,toNeiOut);
triad(2,1)=length(c2);
if ~isempty(c2)
    for i=1:length(c2)
        if dataEpinion(find2(ia2(i)),3)>0 && dataEpinion(find3(ib2(i)),3)>0
            triad(2,2)=triad(2,2)+1;
        else if dataEpinion(find2(ia2(i)),3)<0 && dataEpinion(find3(ib2(i)),3)>0
                triad(2,3)=triad(2,3)+1;
            else if dataEpinion(find2(ia2(i)),3)<0 && dataEpinion(find3(ib2(i)),3)<0
                    triad(2,4)=triad(2,4)+1;
                else if dataEpinion(find2(ia2(i)),3)>0 && dataEpinion(find3(ib2(i)),3)<0
                        triad(2,5)=triad(2,5)+1;
                    end
                end
            end
        end
    end
end

%% find the FB

[c3,ia3,ib3]=intersect(fromNeiOut,toNeiOut);
triad(3,1)=length(c3);
if ~isempty(c3)
    for i=1:length(c3)
        if dataEpinion(find1(ia3(i)),3)>0 && dataEpinion(find3(ib3(i)),3)>0
            triad(3,2)=triad(3,2)+1;
        else if dataEpinion(find1(ia3(i)),3)<0 && dataEpinion(find3(ib3(i)),3)>0
                triad(3,3)=triad(3,3)+1;
            else if dataEpinion(find1(ia3(i)),3)<0 && dataEpinion(find3(ib3(i)),3)<0
                    triad(3,4)=triad(3,4)+1;
                else if dataEpinion(find1(ia3(i)),3)>0 && dataEpinion(find3(ib3(i)),3)<0
                        triad(3,5)=triad(3,5)+1;
                    end
                end
            end
        end
    end
end
%% find the BF
[c4,ia4,ib4]=intersect(fromNeiIn,toNeiIn);
triad(4,1)=length(c4);
if ~isempty(c4)
    for i=1:length(c4)
        if dataEpinion(find2(ia4(i)),3)>0 && dataEpinion(find4(ib4(i)),3)>0
            triad(4,2)=triad(4,2)+1;
        else if dataEpinion(find2(ia4(i)),3)<0 && dataEpinion(find4(ib4(i)),3)>0
                triad(4,3)=triad(4,3)+1;
            else if dataEpinion(find2(ia4(i)),3)<0 && dataEpinion(find4(ib4(i)),3)<0
                    triad(4,4)=triad(4,4)+1;
                else if dataEpinion(find2(ia4(i)),3)>0 && dataEpinion(find4(ib4(i)),3)<0
                        triad(4,5)=triad(4,5)+1;
                    end
                end
            end
        end
    end
end

em=sum(triad(:,1));

