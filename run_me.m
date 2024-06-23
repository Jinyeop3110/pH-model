ph_vary=[3.5,4.5,5.5,6.5,7.5,8.5,9.5];
ph_vary_growth=zeros(54,7);
ph_vary_ph=zeros(54,6);
h24=[0,6,12,18,24];
ph_24h=zeros(54,5);
OD_24h=zeros(54,5);

%%
ph95=[8.5 6.2 6.7 7.8 8.2 8.5 8.6 7.0 6.5
5.7 7.4 7.9 6.1 7.1 6.3 6.3 6.3 7.0
8.1 6.0 8.9 8.6 8.5 9.2 7.0 7.8 6.6
7.8 6.7 5.8 7.9 6.8 7.6 8.2 6.7 7.1
7.6 7.5 9.0 8.9 8.8 6.3 7.6 6.3 7.5
7.8 8.3 5.9 7.3 7.8 8.4 8.2 7.0 7.8
];

ph85=[8.2 5.9 5.1 7.3 7.6 7.6 7.7 6.5 6.2
5.6 7.3 7.7 5.7 6.4 5.6 6.4 6.4 5.9
7.0 5.8 8.9 8.3 8.0 9.0 6.9 7.5 6.5
7.5 6.4 5.7 8.9 8.9 7.5 6.1 6.8 6.3
7.2 5.9 8.9 9.1 8.2 6.0 7.0 6.2 7.4
7.7 7.9 5.9 6.0 7.6 7.9 6.7 6.5 4.9
];

ph75=[7.4 5.7 4.9 6.9 5.8 6.9 7.3 6.6 6.2
5.2 6.9 7.4 5.7 6.3 5.5 6.2 6.5 5.1
6.9 5.6 9.0 8.0 7.5 9.1 6.7 7.2 6.6
7.4 6.4 5.5 8.9 7.0 7.3 6.2 6.9 6.4
7.1 5.7 8.7 8.9 7.8 5.4 7.3 6.0 7.2
7.5 7.6 6.2 6.3 7.1 8.9 6.5 6.6 4.7
];

ph65=[7.3 4.7 4.6 8.4 4.0 5.7 8.4 3.2 4.4
    4.5 6.7 7.1 5.1 4.8 4.5 4.8 5.0 3.4
    6.0 4.5 9.3 9.0 6.3 9.3 7.0 7.0 5.3
    7.0 6.9 5.0 9.3 7.2 6.1 5.0 4.1 3.7
    7.5 5.1 9.2 9.2 8.8 5.9 6.9 5.6 7.5
    8.5 7.3 4.7 4.7 6.6 5.7 4.8 4.5 3.8];

ph55=[5.5 4.3 4.4 5.9 4.0 5.3 5.5 3.1 4.0
4.3 5.5 5.7 4.6 4.6 4.3 4.5 4.5 3.8
5.3 4.3 8.7 6.8 6.0 8.9 5.8 5.6 4.8
5.4 5.4 5.6 9.1 6.1 5.6 4.1 4.4 4.2
8.5 6.2 8.7 9.0 7.9 6.0 6.1 4.9 7.1
8.9 6.4 4.9 4.1 5.5 6.6 5.5 4.5 3.9
];

ph45=[4.5 4.1 4.2 5.0 3.7 4.4 5.1 3.4 3.9
4.2 4.5 4.6 4.7 4.3 4.1 4.8 4.8 3.7
4.3 4.0 8.8 6.6 5.7 8.7 6.4 5.1 4.4
4.5 5.9 5.1 8.9 6.3 5.6 4.4 4.3 3.9
8.2 6.0 8.6 8.9 6.8 5.2 4.9 4.7 7.2
8.4 6.4 5.3 4.1 4.5 4.7 4.1 3.9 3.7
];

for i=1:6
    for j=1:9
        ph_vary_ph(i+6*(j-1),1)=ph45(i,j);
        ph_vary_ph(i+6*(j-1),2)=ph55(i,j);
        ph_vary_ph(i+6*(j-1),3)=ph65(i,j);
        ph_vary_ph(i+6*(j-1),4)=ph75(i,j);
        ph_vary_ph(i+6*(j-1),5)=ph85(i,j);
        ph_vary_ph(i+6*(j-1),6)=ph95(i,j);
    end
end
%%
for i=1:7
    a0=importdata(['pH',num2str(i+2.5),'.xlsx']);
    a0=a0.data.Sheet2(23:30,:);
    a0=abs(a0-mean(mean(a0(:,11:12))));
    for j=1:6
        for k=1:9
            ph_vary_growth(j+6*(k-1),i)=a0(j,k);
        end
    end
end

%%
ph6=[6.1 6.0 5.7 6.1 6.1 6.2 6.2 6.1 6.1
6.0 6.2 6.3 6.2 6.1 6.1 6.0 6.1 6.1 
6.3 6.0 5.7 6.2 6.2 6.0 6.0 6.1 6.0
6.2 6.0 5.8 6.9 6.3 6.2 6.1 5.9 6.0
6.5 6.2 5.8 5.6 6.2 6.0 6.2 6.2 6.3
6.7 6.3 6.1 6.1 6.2 6.2 6.0 5.9 6.1
];

ph12=[6.5 4.8 4.6 6.0 4.1 5.9 6.5 4.6 4.7
4.5 6.3 6.7 5.0 5.0 4.6 4.9 4.9 4.0
6.2 4.3 6.6 6.7 6.3 7.0 6.0 6.2 5.2
6.6 6.3 5.0 8.9 6.9 6.3 5.0 4.0 3.9
7.5 4.4 6.7 7.0 7.0 4.5 5.4 5.2 6.4
8.0 6.8 5.0 4.5 6.2 5.7 4.3 4.4 3.9
];

ph18=[6.8 4.5 4.7 6.5 4.7 6.1 6.5 3.2 4.6
4.6 6.7 6.9 5.0 4.5 4.3 4.8 5.0 3.5
6.0 4.4 8.8 7.7 6.6 8.9 7.4 6.4 5.3
6.7 6.9 5.2 9.1 6.8 6.3 4.1 3.7 3.5
7.3 4.5 8.9 8.9 8.5 5.5 5.5 5.0 6.7
8.4 6.8 4.4 3.7 6.4 6.9 4.9 4.2 3.6
];

ph24=[7.0 4.4 4.7 7.1 3.8 5.6 6.4 3.1 4.3
4.4 6.7 7.0 4.8 4.4 4.3 4.8 4.9 3.4
6.2 4.3 9.0 8.6 6.7 9.1 8.2 6.9 5.3
7.0 7.0 5.3 9.1 6.5 6.4 4.8 4.1 3.6
7.4 4.6 9.1 9.1 8.5 5.3 6.3 5.3 6.9
8.5 6.8 4.5 3.7 6.4 6.3 4.7 4.2 3.5
];


for i=1:6
    for j=1:9
        ph_24h(i+6*(j-1),1)=6.5;
        ph_24h(i+6*(j-1),2)=ph6(i,j);
        ph_24h(i+6*(j-1),3)=ph12(i,j);
        ph_24h(i+6*(j-1),4)=ph18(i,j);
        ph_24h(i+6*(j-1),5)=ph24(i,j);
    end
end
%%
for i=2:5
    a0=importdata(['HN',num2str(h24(i)),'hours.xlsx']);
    a0=a0.data.Sheet2(23:30,:);
    a0=abs(a0-mean(mean(a0(:,11:12))));
    for j=1:6
        for k=1:9
            OD_24h(j+6*(k-1),i)=a0(j,k);
        end
    end
end

%%
for j=3
    for i=1
        figure(i+6*(j-1));
        set(gcf,'position',[50,50,1350,750]);

		subplot(1,2,1)
        yyaxis left;
        plot(h24,OD_24h(i+6*(j-1),:),'*--','linewidth',1.5);
        xlabel('hours');
        ylabel('OD');
        hold on;
        set(gca,'linewidth',1.5,'fontsize',12);
        yyaxis right;
        plot(h24,ph_24h(i+6*(j-1),:),'^--','linewidth',1.5);
        ylabel('pH');
        hold off;
		
		subplot(1,2,2);
        figure(i+6*(j-1));
        yyaxis left;
        plot(ph_vary,ph_vary_growth(i+6*(j-1),:),'*--','linewidth',1.5);
        xlabel('media pH value');
        ylabel('24-hour OD');
        set(gca,'linewidth',1.5,'fontsize',12);
        hold on;
        yyaxis right;
        plot(ph_vary(2:7),ph_vary_ph(i+6*(j-1),:),'^--','linewidth',1.5);
        ylabel('pH after 24 hours');
        hold off;

    end
end
%%
ph_24h_f=zeros(1,54);
ph_24h_l=zeros(1,54);
ph_favored=zeros(1,54);
growth_ph_changed=zeros(1,54);
for i=1:54
    ph_24h_l(i)=min(ph_24h(i,:));
    ph_24h_f(i)=ph_24h(i,end);
    a=[ph_vary_growth(i,:);ph_vary]';
    a=sortrows(a,1,'descend');
    ph_favored(i)=mean(a(1:3,2));

    a=ph_24h_f(i);
    for d=1:7
        if ph_vary(d)>a 
            if d>1
                x=ph_vary(d)-a;
                growth_ph_changed(i)=ph_vary_growth(i,d)*(1-x)+x*ph_vary_growth(i,d-1);
            else
                growth_ph_changed(i)=ph_vary_growth(i,d);
            end
            break;
        end
    end
end
scatter3(ph_24h_f,growth_ph_changed,1:54);
ylabel('growth');xlabel('changed pH');zlabel('species number');
set(gca,'linewidth',1.5,'fontsize',12);