Alt=size(x0);
if Alt(1)+Alt(2)==2
plot(t,u,'r');
elseif Alt(1)+Alt(2)==3
figure(1)
subplot(2,1,1)
plot(t,u(1,:),'r')
subplot(2,1,2)
plot(t,u(2,:),'g')
figure(2)
plot(u(1,:),u(2,:),'r')
elseif Alt(1)+Alt(2)==4
figure(1)
subplot(3,1,1)
plot(t,u(1,:),'r')
subplot(3,1,2)
plot(t,u(2,:),'g')
subplot(3,1,3)
plot(t,u(3,:),'b')
figure(2)
plot3(u(1,:),u(2,:),u(3,:),'r')
elseif Alt(1)+Alt(2)==5
figure(1)
subplot(4,1,1)
plot(t,u(1,:),'r')
subplot(4,1,2)
plot(t,u(2,:),'g')
subplot(4,1,3)
plot(t,u(3,:),'b')
subplot(4,1,4)
plot(t,u(4,:),'m')
figure(2)
plot(u(1,:),u(3,:),'r')
xlabel('x1')
ylabel('x2')
end
