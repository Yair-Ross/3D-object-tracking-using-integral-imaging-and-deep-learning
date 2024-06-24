import numpy as np
import cv2
import pandas as pd
import matplotlib.pyplot as plt
import scipy.signal
#from PIL import Image

def random_colors(N):
    np.random.seed(1)
    colors = [tuple(255 * np.random.rand(3)) for _ in range(N)]
    return colors


def apply_masck(image, mask, color, alpha=0.5):
    """apply mask to image"""
    for n, c in enumerate(color):
        image[:, :, n] = np.where(
            mask == 1,
            image[:, :, n] * (1 - alpha) + alpha * c,
            image[:, :, n]

        )
        image[:, :, n] = np.where(
            mask != 1,
            image[:, :, n],
            image[:, :, n]

        )
    return image



def tracker(frame_inf, fs):
    objs_num = {}
    for name in frame_inf[:, 1]:
        if not name in objs_num:  # add new char
            objs_num[name] = 1
        # else:
        #    objs_num[name] += 1  # count char
    names = []
    for i, line in enumerate(frame_inf):
        canidates = []
        name = ""
        dist = 100000
        for j, prev in enumerate(frame_inf):
            if prev[0] == line[0] - fs and line[1] == prev[1]:
                canidates.append((prev, j))

        if len(canidates) == 0:
            name = line[1] + ' ' + str(objs_num[line[1]])
            objs_num[line[1]] += 1
        else:
            for obj in canidates:
                temp = np.linalg.norm(np.array((obj[0][6], obj[0][7], obj[0][5])) - np.array((line[6], line[7], line[5])))
                if temp < dist:
                    name = names[obj[1]]
                    dist = temp
        names.append(name)
    return names


def tracker2(frame_inf, fs, max_frame):
    objs_num = {}
    for name in frame_inf[:, 1]:
        if not name in objs_num:  # add new char
            objs_num[name] = 1

    for i, line in enumerate(frame_inf):
        if line[0] == fs:
            frame_inf[i][15] = line[1] + ' ' + str(objs_num[line[1]])
            objs_num[line[1]] += 1
        else:
            break

    frame_num = fs
    while frame_num + fs <= max_frame:
        current_objs = []
        next_objs = []
        for i, obj in enumerate(frame_inf):
            if obj[0] == frame_num:
                current_objs.append((obj, i))
            elif obj[0] == frame_num + fs:
                next_objs.append((obj, i))
        for obj in current_objs:
            dist = 400 #later will be threshold dist
            new = True
            temp_next = None
            for next in next_objs:
                dist_xyz = np.linalg.norm(np.array((obj[0][6], obj[0][7], obj[0][5])) - np.array((next[0][6], next[0][7], next[0][5])))
                if dist_xyz < dist and next[0][1] == obj[0][1]:
                    dist = dist_xyz
                    new = False
                    temp_next = next
            if not new:
                frame_inf[temp_next[1]][15] = obj[0][15]
                next_objs.remove(temp_next)

        for obj in next_objs:
            frame_inf[obj[1]][15] = obj[0][1] + ' ' + str(objs_num[obj[0][1]])
            objs_num[obj[0][1]] += 1

        frame_num += fs

    return frame_inf


def tracker3(frame_inf, fs, max_frame):
    objs_num = {}
    for name in frame_inf[:, 1]:
        if not name in objs_num:  # add new char
            objs_num[name] = 1

    for i, line in enumerate(frame_inf):
        if line[0] == fs:
            frame_inf[i][15] = line[1] + ' ' + str(objs_num[line[1]])
            objs_num[line[1]] += 1
        else:
            break

    frame_num = fs
    while frame_num + fs <= max_frame:
        prev_objs = []
        curr_objs = []
        for i, obj in enumerate(frame_inf):
            if obj[0] == frame_num:
                prev_objs.append((obj, i))
            elif obj[0] == frame_num + fs:
                curr_objs.append((obj, i))
        for curr in curr_objs:
            dist = 400 #later will be threshold dist
            new = True
            temp_prev = None
            for prev in prev_objs:
                dist_xyz = np.linalg.norm(np.array((curr[0][6], curr[0][7], curr[0][5])) - np.array((prev[0][6], prev[0][7], prev[0][5])))
                if dist_xyz < dist and prev[0][1] == curr[0][1]:
                    dist = dist_xyz
                    new = False
                    temp_prev = prev
            if not new:
                frame_inf[curr[1]][15] = temp_prev[0][15]
                prev_objs.remove(temp_prev)

        for obj in curr_objs:
            if frame_inf[obj[1]][15] == "name":
                frame_inf[obj[1]][15] = obj[0][1] + ' ' + str(objs_num[obj[0][1]])
                objs_num[obj[0][1]] += 1

        frame_num += fs

    return frame_inf


def tracker4(frame_inf, fs, max_frame):
    objs_num = {}
    for name in frame_inf[:, 1]:
        if not name in objs_num:  # add new char
            objs_num[name] = 1

    for i, line in enumerate(frame_inf):
        if line[0] == fs:
            frame_inf[i][15] = line[1] + ' ' + str(objs_num[line[1]])
            objs_num[line[1]] += 1
        else:
            break

    frame_num = fs
    while frame_num + fs <= max_frame:
        current_objs = []
        next_objs = []
        next2_objs = []
        next3_objs = []
        for i, obj in enumerate(frame_inf):
            if obj[0] == frame_num:
                current_objs.append((obj, i))
            elif obj[0] == frame_num + fs:
                next_objs.append((obj, i))
            elif obj[0] == frame_num + 2*fs:
                next2_objs.append((obj, i))
            elif obj[0] == frame_num + 3*fs:
                next3_objs.append((obj, i))
        for obj in current_objs:
            dist = 400 #later will be threshold dist
            new = True
            temp_next = None
            for next in next_objs:
                dist_xyz = np.linalg.norm(np.array((obj[0][6], obj[0][7], obj[0][5])) - np.array((next[0][6], next[0][7], next[0][5])))
                if dist_xyz < dist and next[0][1] == obj[0][1]:
                    dist = dist_xyz
                    new = False
                    temp_next = next
            if new:
                for next in next2_objs:
                    dist_xyz = np.linalg.norm(
                        np.array((obj[0][6], obj[0][7], obj[0][5])) - np.array((next[0][6], next[0][7], next[0][5])))
                    if dist_xyz < dist and next[0][1] == obj[0][1]:
                        dist = dist_xyz
                        new = False
                        temp_next = next
            if new:
                for next in next3_objs:
                    dist_xyz = np.linalg.norm(
                        np.array((obj[0][6], obj[0][7], obj[0][5])) - np.array((next[0][6], next[0][7], next[0][5])))
                    if dist_xyz < dist and next[0][1] == obj[0][1]:
                        dist = dist_xyz
                        new = False
                        temp_next = next
            if not new:
                frame_inf[temp_next[1]][15] = obj[0][15]
                if temp_next in next_objs:
                    next_objs.remove(temp_next)
                elif temp_next in next_objs:
                    next2_objs.remove(temp_next)
                elif temp_next in next_objs:
                    next3_objs.remove(temp_next)

        for obj in next_objs:
            if frame_inf[obj[1]][15] == "name":
                frame_inf[obj[1]][15] = obj[0][1] + ' ' + str(objs_num[obj[0][1]])
                objs_num[obj[0][1]] += 1

        frame_num += fs

    return frame_inf


#def better_display_instances(image, num, frame_inf, name_list):
def better_display_instances(image, num, frame_inf):
    for i, line in enumerate(frame_inf):
        if line[0] == num:
            image = apply_masck(image, line[10], tuple(255 * np.random.rand(3)))
            image = cv2.rectangle(image, (line[12], line[11]), (line[14], line[13]), (0,0,255), 2)
            #caption = '{} z={:.0f}[mm]'.format(line[1], line[5])

            caption1 = str(frame_inf[i][15])
            #caption1 = str(name_list[i])
            image = cv2.putText(
                image, caption1, (line[12], line[11]), cv2.FONT_HERSHEY_COMPLEX, 0.7, [255, 255, 255], 2
            )
            #caption2 = 'z=' + str(line[5])
            if line[15] == 'car 1':
                caption2 = 'z=' + '${:.2f}'.format(line[17])+ '${:.2f}'.format(line[18])+ '{:.2f}'.format(line[19])
            else:
                caption2 = 'z='

            image = cv2.putText(
                image, caption2, (line[12], line[13]), cv2.FONT_HERSHEY_COMPLEX, 0.7, [255, 255, 255], 2
            )
    return image



def display_instances(image, boxes, masks, ids, names, scores, ids_list=None, distance=None, d_i=None):
    num_instances = boxes.shape[0]  ## number of object in the frame

    #
    # print('NO INSTANCES TO DISPLAY')
    # else:
    # assert boxes.shape[0] == masks.shape[-1] == ids.shape[0]

    # new_ids_list = list(set(ids_list) & set(ids))
    # num_instances = len(new_ids_list)
    lst = []
    scr = []
    lst_roi_rat = []
    lst_mask_rat = []
    dist_list = []
    colors = random_colors(num_instances)
    height, width = image.shape[:2]
    frame_array = image.shape[0] * image.shape[1] #array of the frame
    for i, color in enumerate(colors):
        if not np.any(boxes[i]):
            continue

        y1, x1, y2, x2 = boxes[i]
        mask = masks[:, :, i]
        roi_array = np.abs((y2 - y1) * (x2 - x1))
        mask_size = (mask == 1).sum()
        roi_ratio = np.float16(roi_array / frame_array)  # the pixel ratio between the frame size and the ROI
        mask_ratio = np.float16(mask_size / frame_array)
        image = apply_masck(image, mask, color)
        image = cv2.rectangle(image, (x1, y1), (x2, y2), color, 2)

        label = names[ids[i]]
        score = scores[i] if scores is not None else None
        lst.append(label)
        scr.append(score)
        lst_roi_rat.append(roi_ratio)
        lst_mask_rat.append(mask_ratio)
        dist_list.append(distance)
        # dist = "distance:{:.0f}[mm]".format(distance)if dist is not None else None
        if distance is None:
            caption = '{} {:.2f} '.format(label, score) if score else label

        else:
            #caption = '{} {:.2f} z={:.0f}[mm]'.format(label, score, distance[d_i]) if score else label
            caption = '{} z={:.0f}[mm]'.format(label, distance[d_i]) if score else label
            d_i = d_i + 1

        # caption = '{} {:.2f} '.format(label, score) if score else label
        image = cv2.putText(
            image, caption, (x1, y1), cv2.FONT_HERSHEY_COMPLEX, 0.7, [255,255,255], 2
        )
    dict = {'Lable': lst, 'score': scr, 'ROI ratio': lst_roi_rat, 'mask ratio': lst_mask_rat, 'Distance': dist_list}
    df = pd.DataFrame(dict)

    return image, df, d_i




def display_instances_roi(image, ei_rgb, boxes, mask, ids, names, scores, elemental_frame,frame_num, distance=None):
    num_instances = boxes.shape[0]  ## number of object in the frame

    #
    # print('NO INSTANCES TO DISPLAY')
    # else:
    # assert boxes.shape[0] == masks.shape[-1] == ids.shape[0]

    #new_ids_list = list(set(ids_list) & set(ids))
    num_instances = 1 #len(new_ids_list)
    lst = []
    scr = []
    lst_roi_rat = []
    lst_mask_rat = []
    dist_list = []
    cm_x_lst = []
    cm_y_lst = []
    rec = np.zeros(shape=[image.shape[0], image.shape[1]]) ##   rec = np.zeros(shape=image.shape)
    roi_mask = np.zeros(shape=[image.shape[0], image.shape[1]]) ## roi_mask = np.zeros(shape=image.shape)

    color = random_colors(1)[0]
    frame_array = image.shape[0] * image.shape[1]
    y1, x1, y2, x2 = boxes
    roi_array = np.abs((y2 - y1) * (x2 - x1))
    mask_size = (mask == 1).sum()
    roi_ratio = np.float16(roi_array / frame_array)  # the pixel ratio between the frame size and the ROI
    mask_ratio = np.float16(mask_size / frame_array) #this is the compactness ratio // add extent ratio y2-y1/x2-x1
    cm_x = np.float16(np.average([x1, x2]))
    cm_y = np.float16(np.average([y1, y2]))
    image = apply_masck(image, mask, [0, 0, 255], alpha=0.15)
    image = cv2.rectangle(image, (x1, y1), (x2, y2), [255, 255, 255], 3)
    label = names[ids]
    score = scores
    lst.append(label)
    scr.append(score)
    lst_roi_rat.append(roi_ratio)
    lst_mask_rat.append(mask_ratio)
    dist_list.append(distance)
    rec[y1:y2, x1:x2] = 1


    roi_mask[:, :] = np.where(
            mask == 1, ##rec==1
            1,
            roi_mask[:, :],
        )
    label = names[ids]
    score = scores
    lst = (label)
    scr=(score)
    lst_roi_rat=(roi_ratio)
    lst_mask_rat=(mask_ratio)
    dist_list=(distance)
    cm_x_lst=(cm_x)
    cm_y_lst=(cm_x)

    if distance is None:
        caption = '{} {:.2f} '.format(label, score) if score else label
        cap_dist = '.'
    else:
        caption = '{} {:.2f} '.format(label, score) if score else label
        cap_dist = 'z={:.0f}[mm]'.format(distance)##'z={:.0f}[mm]'
    #image[:, :, 0] = roi_mask * image[:, :, 0]
    #image[:, :, 1] = roi_mask * image[:, :, 1]
    #image[:, :, 2] = roi_mask * image[:, :, 2]

    image[:, :, 0] = rec * image[:, :, 0]
    image[:, :, 1] = rec * image[:, :, 1]
    image[:, :, 2] = rec * image[:, :, 2]
    ##image[:, :] = roi_mask * image
    image = cv2.putText(image, caption, (x1+30, y1-40), cv2.FONT_HERSHEY_COMPLEX, 0.9, [255, 255, 255], 2)
    image = cv2.putText(image, cap_dist, (x1+30, y1-10), cv2.FONT_HERSHEY_COMPLEX,0.9, [255, 255, 255], 2)

    extent_ratio = np.abs((y2 - y1) / (x2 - x1))
    scope = 0
    """for v,i in enumerate(mask):
        for d,j in enumerate(mask[i]):
            if i-1 >= 0 and mask[i-1][j] == 0:
                scope += 1
            elif i+1 < (y2 - y1) and mask[i+1][j] == 0:
                scope += 1
            elif j-1 >= 0 and mask[i][j-1] == 0:
                scope += 1
            elif j+1 < (x2 - x1) and mask[i][j+1] == 0:
                scope += 1"""
    """neighbor_mask = (
            (mask == 1) &  # Ones in the original mask
            (
                    np.roll(mask, 1, axis=0) == 0 |  # Check neighbor above
                    np.roll(mask, -1, axis=0) == 0 |  # Check neighbor below
                    np.roll(mask, 1, axis=1) == 0 |  # Check neighbor to the left
                    np.roll(mask, -1, axis=1) == 0  # Check neighbor to the right
            ).any(axis=0).any(axis=1)
    )
    # Count the ones in the modified mask
    scope = (mask == 1 & mask)"""
    #b = 1 - mask
    #c = scipy.signal.convolve2d(b, np.ones((3, 3)), mode='same')
    #scope = np.where(c > 0, 1, 0).sum()
    b = np.argwhere(mask == 1)
    b_set = set(map(tuple, b))
    # Dictionary to store results for each coordinate in b
    result = {tuple(coord): all(tuple(neighbor) in b_set for neighbor in [
        (coord[0] - 1, coord[1]),
        (coord[0] - 1, coord[1] - 1),
        (coord[0] - 1, coord[1] + 1),
        (coord[0] + 1, coord[1]),
        (coord[0] + 1, coord[1] - 1),
        (coord[0] + 1, coord[1] + 1),
        (coord[0], coord[1] - 1),
        (coord[0], coord[1] + 1)
    ]) for coord in b}

    scope = sum(result.values())
    irregularity = (scope**2)/(mask_size*3.14*4)

    contr = np.std(image[y1:y2, x1:x2])

    r_sum, g_sum, b_sum = 0, 0, 0
    for i in range(y2 - y1):
        for j in range(x2 - x1):
            #(R, G, B) = ei[i, j]
            (R, G, B) = ei_rgb[i+y1][j+x1]
            print(str(ei_rgb[i+y1][j+x1]) + "colorsssssssssssssssssssssssssssssssssssssssss")
            #if(ei_rgb[i,j][0] > 50 or ei_rgb[i,j][1] > 50 or ei_rgb[i,j][2] > 50):
            #    print("welllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll")
            #print(image[i,j])
            r_sum += R
            g_sum += G
            b_sum += B
    r_avg = r_sum / ((y2 - y1)*(x2 - x1))
    g_avg = g_sum / ((y2 - y1) * (x2 - x1))
    b_avg = b_sum / ((y2 - y1) * (x2 - x1))

    data = [frame_num, lst, scr, lst_roi_rat, lst_mask_rat, int(distance),  cm_x, cm_y, extent_ratio, irregularity, mask, y1, x1, y2, x2, 'name', contr, r_avg, g_avg, b_avg]
    #dict = {'Lable': lst, 'score': scr, 'ROI ratio': lst_roi_rat, 'mask ratio': lst_mask_rat, 'Distance': dist_list, 'c.m x': cm_x, 'c.m y': cm_y}
    #df = pd.DataFrame(dict)

    return image, data








def apply_masck_tube(image, mask, elemental_frame):
    """apply mask to image"""
    for n in range(3):
        image[:, :, n] = np.where(
            mask == 1,
            image[:, :, n]*0 + elemental_frame[:, :, n],
            image[:, :, n]

        )
        image[:, :, n] = np.where(
            mask != 1,
            image[:, :, n]*0,
            image[:, :, n]

        )
    return image


def display_instances_tube(image, boxes, mask, ids, names, scores, elemental_frame, distance=None):
## For the virsion with the coler masks
    lst = []
    scr = []
    lst_roi_rat = []
    lst_mask_rat = []
    dist_list = []
    height, width = image.shape[:2]
    color = random_colors(1)[0]

    frame_array = image.shape[0] * image.shape[1]
    y1, x1, y2, x2 = boxes
    roi_array = np.abs((y2 - y1) * (x2 - x1))
    mask_size = (mask == 1).sum()
    roi_ratio = np.float16(roi_array / frame_array)  # the pixel ratio between the frame size and the ROI
    mask_ratio = np.float16(mask_size / frame_array)
    image = apply_masck_tube(image, mask, elemental_frame)
    image = cv2.rectangle(image, (x1, y1), (x2, y2), [255, 255, 255], 2)
    label = names[ids]
    score = scores
    lst.append(label)
    scr.append(score)
    lst_roi_rat.append(roi_ratio)
    lst_mask_rat.append(mask_ratio)
    dist_list.append(distance)


    if distance is None:
        caption = '{} {:.2f} '.format(label, score) if score else label
        cap_dist = '.'
    else:
        caption = '{} {:.2f} '.format(label, score) if score else label
        cap_dist = 'z={:.0f}[mm]'.format(distance)##'z={:.0f}[mm]'
    image = cv2.putText(image, caption, (x1 + 30, y1 - 40), cv2.FONT_HERSHEY_COMPLEX, 0.9, [255, 255, 255], 2)
    image = cv2.putText(image, cap_dist, (x1 + 30, y1 - 10), cv2.FONT_HERSHEY_COMPLEX, 0.9, [255, 255, 255], 2)
    dict = {'Lable': lst, 'score': scr, 'ROI ratio': lst_roi_rat, 'mask ratio': lst_mask_rat, 'Distance': dist_list}
    df = pd.DataFrame(dict)
    return image, df


