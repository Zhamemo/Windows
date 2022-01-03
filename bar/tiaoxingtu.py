import matplotlib.pyplot as plt

import numpy as np

x = np.arange(5)
y1_yaw = [0.06, 0.03, 0.08, 0.12, 0.22]
y2_yaw = [0.06, 0.03, 0.07, 0.12, 0.22]
y1_pitch = [1.24, 1.17, 1.34, 1.17, 1.38]
y2_pitch = [1.23, 1.16, 1.34, 1.16, 1.38]
y1_roll = [0.05, 0.05, 0.12, 0.1, 0.25]
y2_roll = [0.05, 0.05, 0.11, 0.1, 0.24]
# y1_yaw = [945.82, 935.27,816.77, 1012.69, 831.17]
# y2_yaw = [945.84, 935.69, 816.65, 1012.83, 831.85]
# y1_pitch = [9.53, 41.82, 29.6, 96.24, 21.56]
# y2_pitch = [10.02, 41.44, 29.75, 96.92, 21.59]
# y1_roll = [632.47, 652.94, 777.9, 588.03, 878.25]
# y2_roll = [632.9, 653.06, 777.39, 587.93, 877.93]

bar_width = 0.4
tick_label = ['camera1,2', 'camera2,3', 'camera3,4', 'camera4,5', 'camera5,1']

plt.subplot(1, 3, 1)
plt.bar(x, y1_yaw, bar_width, color='dodgerblue', label='Zhang')
plt.bar(x + bar_width, y2_yaw, bar_width, color='orchid', label='Rotation plate')
plt.legend(loc='upper left')
plt.xticks(x + bar_width / 2, tick_label)
plt.ylabel('|Yaw|/°', fontsize=12)
# plt.ylabel('|tx|/mm', fontsize=12)
# plt.ylim(0, 1800)
plt.ylim(0, 0.3)

for x1, y1_yaw in enumerate(y1_yaw):
    plt.text(x1, y1_yaw, y1_yaw, ha='center', color='k', fontsize=12, rotation=90)
for x2, y2_yaw in enumerate(y2_yaw):
    plt.text(x2 + bar_width, y2_yaw, y2_yaw, ha='center', color='k', fontsize=12, rotation=90)
plt.xticks(x, tick_label, color='k', fontsize=12, rotation=20)

plt.subplot(1, 3, 2)
plt.bar(x, y1_pitch, bar_width, color='dodgerblue', label='Zhang')
plt.bar(x + bar_width, y2_pitch, bar_width, color='orchid', label='Rotation plate')
plt.legend(loc='upper left')
plt.xticks(x + bar_width / 2, tick_label)
plt.ylabel('|Pitch|/°', fontsize=12)
# plt.ylabel('|ty|/mm', fontsize=12)
# plt.ylim(0, 130)
plt.ylim(0,2)

for x1, y1_pitch in enumerate(y1_pitch):
    plt.text(x1, y1_pitch, y1_pitch, ha='center', color='k', fontsize=12, rotation=90)
for x2, y2_pitch in enumerate(y2_pitch):
    plt.text(x2 + bar_width, y2_pitch, y2_pitch, ha='center', color='k', fontsize=12, rotation=90)
plt.xticks(x, tick_label, color='k', fontsize=12, rotation=20)

plt.subplot(1, 3, 3)
plt.bar(x, y1_roll, bar_width, color='dodgerblue', label='Zhang')
plt.bar(x + bar_width, y2_roll, bar_width, color='orchid', label='Rotation plate')
plt.legend(loc='upper left')
plt.xticks(x + bar_width / 2, tick_label)
plt.ylabel('|Roll|/°', fontsize=12)
# plt.ylabel('|tz|/mm', fontsize=12)
# plt.ylim(0, 1400)
plt.ylim(0, 0.3)

for x1, y1_roll in enumerate(y1_roll):
    plt.text(x1, y1_roll, y1_roll, ha='center', color='k', fontsize=12, rotation=90)
for x2, y2_roll in enumerate(y2_roll):
    plt.text(x2 + bar_width, y2_roll, y2_roll, ha='center', color='k', fontsize=12, rotation=90)
plt.xticks(x, tick_label, color='k', fontsize=12, rotation=20)

plt.show()
