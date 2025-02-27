#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>

class Counter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(long long value READ value WRITE setValue NOTIFY valueChanged)
public:
    explicit Counter(QObject *parent = nullptr);
    long long value() { return m_Value; };

public slots:
    void setValue(long long value);

signals:
    void valueChanged(long long newValue);

private:
    long long m_Value {0} ;
};

#endif // COUNTER_H
