N = 30;

length = (1:N);
accuracy = zeros(1, N);

for i=length
    train('images/train', i);
    acc = test('images/test');
    accuracy(i) = acc;
    
end

figure;
plot(length, accuracy);
xlabel('Feature vector length');
ylabel('Accuracy')