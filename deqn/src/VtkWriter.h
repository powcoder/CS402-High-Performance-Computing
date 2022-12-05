https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
#ifndef VTKWRITER_H_
#define VTKWRITER_H_

#include <string>
#include "Mesh.h"

class VtkWriter {
    private:
        std::string dump_basename;

        std::string vtk_header;

        Mesh* mesh;

        void writeVtk(int step, double time);
    public:
        VtkWriter(std::string basename, Mesh* mesh);

        void write(int step, double time);
};
#endif
