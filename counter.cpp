#include "counter.h"

Counter::Counter(QObject* parent) : QObject(parent)
{
}

void Counter::setValue(long long value) {
    if (value == m_Value)
        return;
    m_Value = value;
    emit valueChanged(value);
}
