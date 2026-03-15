def priority_enc4_golden(_in):
    val = int(_in)
    if (val >> 3) & 1:
        return {'out': 3, 'valid': 1}
    elif (val >> 2) & 1:
        return {'out': 2, 'valid': 1}
    elif (val >> 1) & 1:
        return {'out': 1, 'valid': 1}
    elif val & 1:
        return {'out': 0, 'valid': 1}
    else:
        return {'out': 0, 'valid': 0}
