name: CI

on: [push, pull_request]

jobs:
  build-and-test:
    runs-on: ubuntu-latest

    steps:
      # 1. Checkout repository
      - uses: actions/checkout@v4

      # 2. Install system dependencies
      - name: Install dependencies
        run: |
          sudo apt-get update
          sudo apt-get install -y \
            build-essential g++ cmake \
            libpulse-dev libasound2-dev libjack-jackd2-dev \
            libsndfile1-dev libfftw3-dev libflac-dev libvorbis-dev

      # 3. Create build folder
      - name: Prepare build folder
        run: mkdir -p build

      # 4. Build all libraries
      - name: Build libraries
        run: |
          cd build
          cmake .. -DCMAKE_BUILD_TYPE=Release
          cmake --build . -- -j$(nproc)

      # 5. Check library dependencies
      - name: Verify dependencies
        run: |
          cd build
          export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH
          if ldd libdynamic-engine.so | grep -q "not found"; then
            echo "❌ Missing dependency detected!"
            exit 1
          else
            echo "✅ All dependencies found"
          fi

      # 6. Build and run test program
      - name: Build and run test
        run: |
          cd build
          g++ ../tests/test_dynamic_engine.cpp -L. -ldynamic-engine -o test_dynamic_engine
          LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH ./test_dynamic_engine

      # 7. Upload libraries as artifact
      - name: Upload DynEngine libraries
        uses: actions/upload-artifact@v4
        with:
          name: dynengine-libs
          path: build/*.so
